//
//  BaseView.swift
//  WeadyApp
//
//  Created by Alex Lin on 20/10/22.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    let content: Content
    @Binding var viewState: ViewState
    
    init(viewState: Binding<ViewState>,
         @ViewBuilder content: () -> Content) {
        self._viewState = viewState
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { proxy in
            content(viewState)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .applyWith(viewState: $viewState.animation())
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    @ViewBuilder
    private func content(_ state: ViewState) -> some View {
        switch state {
        case .loading:
            LoadingView()
                .transition(.opacity)
        case .error:
            EmptyView()
        case .content, .search:
            content
                .transition(.opacity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(viewState: .constant(.loading), content: {
            
        })
    }
}
