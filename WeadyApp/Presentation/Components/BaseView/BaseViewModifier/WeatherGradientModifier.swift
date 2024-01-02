//
//  BaseViewModifier.swift
//  WeadyApp
//
//  Created by Alex Lin on 24/10/22.
//

import SwiftUI

enum WeatherGradient: Int {
    case morning = 1
    case morningCloudy = 2
    case halfDay = 3
    case halfDayCloudy = 4
    case afternoon = 5
    case afternoonCloudy = 7
    case night = 8
    case nightCloudy = 9
    case stormy = 10
    case search = 11
    case searchNight = 12
}

struct WeatherGradientModifier: ViewModifier {
    
    @Binding var viewState: ViewState
    
    func body(content: Content) -> some View {
        content
            .background {
                currentGradient
                    .ignoresSafeArea()
            }
    }
    
    // MARK: - Private methods
    
    @ViewBuilder
    private var currentGradient: some View {
        switch viewState {
        case .loading, .search:
            LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.searchGradient),
                                  startPoint: .top,
                           endPoint: .bottom)
        case .content(_, let model, let index):
            switch model[index].mainInfo.getGradient(localtime: model[index].mainInfo.mainInfo.localTime, sunrise: model[index].mainInfo.astrologyModel.sun.riseTime,
                                                     sunset: model[index].mainInfo.astrologyModel.sun.setTime) {
            case .morning:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.morningGradient),
                                      startPoint: .top, endPoint: .bottom)
            case .halfDay:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.halfDayGradient),
                                      startPoint: .top, endPoint: .bottom)
            case .afternoon:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.afternoonGradient),
                                      startPoint: .top, endPoint: .bottom)
            case .night:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.nightGradient),
                                      startPoint: .top, endPoint: .bottom)
            case .search:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.searchGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            case .morningCloudy:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.morningCloudyGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            case .halfDayCloudy:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.halfDayCloudyGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            case .afternoonCloudy:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.afternoonCloudyGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            case .nightCloudy:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.nightCloudyGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            case .stormy:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.stormyGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            case .searchNight:
                LinearGradient(gradient: Gradient(colors: WeatherGradientModifier.searchNightGradient),
                                      startPoint: .top,
                                      endPoint: .bottom)
            }
        case .error:
            LinearGradient(gradient: Gradient(colors: [.blue, .blue, .white]), startPoint: .top, endPoint: .bottom)
        }
    }
    
    // MARK: - Sunny Gradients
    
    private static var morningGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 197,
                                                                     green: 219,
                                                                     blue: 252)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 214,
                                                                      green: 180,
                                                                      blue: 206))]
    }
    
    private static var halfDayGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 254,
                                                                     green: 255,
                                                                     blue: 0)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 31,
                                                                      green: 120,
                                                                      blue: 255)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 31,
                                                                      green: 120,
                                                                      blue: 255))]
    }
    
    private static var afternoonGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 67,
                                                                     green: 80,
                                                                     blue: 147)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 255,
                                                                      green: 122,
                                                                      blue: 0)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 255,
                                                                      green: 122,
                                                                      blue: 0))]
    }
    
    private static var nightGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.9, color: RGBColor(red: 54,
                                                                     green: 54,
                                                                     blue: 79)),
                .getEquivalentOpaqueColor(opacity: 0.9, color: RGBColor(red: 0,
                                                                      green: 0,
                                                                      blue: 0))]
    }
    
    private static var searchGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.25, color: RGBColor(red: 0,
                                                                     green: 93,
                                                                     blue: 255)),
                .getEquivalentOpaqueColor(opacity: 0.25, color: RGBColor(red: 255,
                                                                      green: 255,
                                                                      blue: 255))]
    }
    
    private static var searchNightGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.9, color: RGBColor(red: 36,
                                                                     green: 53,
                                                                     blue: 83)),
                .getEquivalentOpaqueColor(opacity: 0.9, color: RGBColor(red: 80,
                                                                      green: 80,
                                                                      blue: 123))]
    }
    
    
    // MARK: - Cloudy Gradients
    
    private static var morningCloudyGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 103,
                                                                     green: 122,
                                                                     blue: 150)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 237,
                                                                      green: 217,
                                                                      blue: 233))]
    }
    
    private static var halfDayMidCloudyGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 65,
                                                                     green: 81,
                                                                     blue: 105)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 254,
                                                                      green: 255,
                                                                      blue: 182)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 111,
                                                                      green: 152,
                                                                      blue: 185)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 26,
                                                                      green: 91,
                                                                      blue: 187))]
    }
    
    private static var halfDayCloudyGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 10,
                                                                     green: 16,
                                                                     blue: 26)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 161,
                                                                      green: 174,
                                                                      blue: 193)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 26,
                                                                      green: 91,
                                                                      blue: 187))]
    }
    
    private static var afternoonCloudyGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 10,
                                                                     green: 16,
                                                                     blue: 26)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 67,
                                                                      green: 80,
                                                                      blue: 147)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 74,
                                                                      green: 36,
                                                                      blue: 0))]
    }
    
    private static var nightCloudyGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.9, color: RGBColor(red: 53,
                                                                     green: 52,
                                                                     blue: 52)),
                .getEquivalentOpaqueColor(opacity: 0.9, color: RGBColor(red: 42,
                                                                      green: 42,
                                                                      blue: 64))]
    }
    
    private static var stormyGradient: [Color] {
        return [.getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 0,
                                                                     green: 0,
                                                                     blue: 0)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 68,
                                                                      green: 73,
                                                                      blue: 81)),
                .getEquivalentOpaqueColor(opacity: 0.3, color: RGBColor(red: 161,
                                                                      green: 174,
                                                                      blue: 193))]
    }
}

// MARK: - Extension ViewModifier for View

extension View {
    func applyWith(viewState: Binding<ViewState>) -> some View {
        modifier(WeatherGradientModifier(viewState: viewState))
    }
}
