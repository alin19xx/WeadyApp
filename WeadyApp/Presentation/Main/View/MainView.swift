//
//  MainView.swift
//  WeadyApp
//
//  Created by Alex Lin on 20/10/22.
//

import SwiftUI

class ThemeMode: ObservableObject {
    
    enum Mode {
        case dark, light
    }
    
    var backgroundGradient: WeatherGradient?
    var modeColor: Mode?
}

private struct ThemeModeKey: EnvironmentKey {
  static let defaultValue = ThemeMode()
}

extension EnvironmentValues {
  var themeMode: ThemeMode {
    get { self[ThemeModeKey.self] }
    set { self[ThemeModeKey.self] = newValue }
  }
}

enum ViewState {
    case loading
    case content(suggestions: [ItemModel]?, current: [MainWeatherModel], index: Int)
    case search
    case error
}

struct MainView: View {
    
    @Environment(\.themeMode) var themeMode
    
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    @State private var currentIndex: Int = 0
    
    @State private var selectedLocation: String?
    @State private var showModalLocation: Bool = false
    
    @ObservedObject var viewModel: MainWeatherViewModel = MainWeatherViewModel()
    
    private enum ModeColors {
        static let lightBackground = RGBColor(red: 252, green: 252, blue: 252)
        static let darkBackground = RGBColor(red: 53, green: 51, blue: 77)
        static let fontColor = RGBColor(red: 196, green: 196, blue: 196)
    }
    
    var body: some View {
        BaseView(viewState: $viewModel.viewState, content: {
            GeometryReader { proxy in
                content(isEditing: isEditing)
            }
        })
        .onChange(of: isEditing, perform: { newValue in
            updateSearchUI(isEditing: newValue)
        })
        .task {
            if viewModel.suggestionsModel.count == 0 {
                viewModel.onAppear()
            }
        }
        .sheet(isPresented: $showModalLocation, onDismiss: {
            selectedLocation = ""
        }, content: {
            if let model = viewModel.modelSearch {
                BaseView(viewState: .constant(.content(suggestions: nil, current: [model], index: 0)), content: {
                    CurrentWeatherView(model: model.mainInfo, isFromSearch: true)
                })
                
            }
        })
    }
    
    // MARK: - Accessory methods
    
    private func content(isEditing: Bool) -> some View {
        VStack(spacing: .zero) {
            WTextfield(text: $text, searching: $isEditing, colorMode: backgroundColor)
            ZStack {
                if isEditing {
                    SearchView(results: $viewModel.suggestionsModel,
                               text: $text, isEditing: $isEditing, selectedLocation: $selectedLocation)
                } else {
                   currentView
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 48)
        .onChange(of: selectedLocation ?? "") { newValue in
            if newValue != "" {
                viewModel.getSearchLocation(query: newValue)
                showModalLocation.toggle()
            }
        }
    }
    
    @ViewBuilder
    private var currentView: some View {
        TabView(selection: $currentIndex, content: {
            ForEach(viewModel.model, id: \.self.id) { page in
                CurrentWeatherView(model: page.mainInfo, isFromSearch: false)
                    .tag(createdTag(page: page))
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .onChange(of: currentIndex) { newValue in
            withAnimation {
                viewModel.viewState = .content(suggestions: viewModel.suggestionsModel, current: viewModel.model, index: newValue)
            }
        }
    }
    
    private func createdTag(page: MainWeatherModel) -> Int {
        guard let index = viewModel.model.firstIndex(where: { $0.id == page.id }) else { return 0 }
        return index
    }
    
    // MARK: - Private methods
    
    private func updateSearchUI(isEditing: Bool) {
        withAnimation {
            viewModel.viewState =  isEditing ? .search : .content(suggestions: viewModel.suggestionsModel, current: viewModel.model, index: currentIndex)
        }
    }
    
    private var backgroundColor: Color {
        return viewModel.model[currentIndex].mainInfo.getGradient(localtime: viewModel.model[currentIndex].mainInfo.mainInfo.localTime,
                                                         sunrise: viewModel.model[currentIndex].mainInfo.astrologyModel.sun.riseTime,
                                                         sunset: viewModel.model[currentIndex].mainInfo.astrologyModel.sun.setTime) == .night ? .getEquivalentOpaqueColor(opacity: 1, color: ModeColors.darkBackground) : .getEquivalentOpaqueColor(opacity: 1, color: ModeColors.lightBackground)
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .sheet(isPresented: .constant(true)) {
//                VStack {
//                    VStack(spacing: 24) {
//                        Image("partly_cloudy_day")
//                            .resizable()
//                            .frame(width: 240, height: 240)
//                        Spacer()
//                    }
//
//                    .background(.red)
//                    .presentationDetents([.fraction(0.50)])
//                .padding(.top, -50)
//                }
//                .presentationDetents([.fraction(0.70)])
//                .background(.blue)
//            }
    }
}
#endif
