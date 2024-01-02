//
//  CurrentWeatherView.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    private enum ModeColors {
        static let lightBackground = RGBColor(red: 252, green: 252, blue: 252)
        static let darkBackground = RGBColor(red: 53, green: 51, blue: 77)
        static let fontColor = RGBColor(red: 196, green: 196, blue: 196)
    }
    
    var model: CurrentWeatherModel
    var isFromSearch: Bool
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                defaultWeatherView
            }
        }
        .transition(.opacity)
    }
    
    // MARK: - Accessory Views
    
    @ViewBuilder
    private var defaultWeatherView: some View {
        VStack(spacing: 20) {
            VStack(spacing: 36) {
                mainInfoView
                forecastView
            }
            currentView
            astrologyView
        }
    }
    
    @ViewBuilder
    private var mainInfoView: some View {
        MainInfoView(model: MainInfoModel(icon: "partly_cloudy_day",
                                          city: model.mainInfo.city,
                                          tempCelcius: model.mainInfo.tempCelcius,
                                          tempFarenheit: model.mainInfo.tempFarenheit,
                                          localTime: model.mainInfo.localTime))
    }
    
    @ViewBuilder
    private var forecastView: some View {
        ForecastCarrousselView(models: model.forecastModel, colorMode: backgroundColor)
    }
    
    @ViewBuilder
    private var currentView: some View {
        CurrentWeatherInfoView(model: model.currentModel, colorMode: backgroundColor)
    }
    
    @ViewBuilder
    private var astrologyView: some View {
        AstrologyInfoView(model: model.astrologyModel, colorMode: backgroundColor)
    }
    
    private var backgroundColor: Color {
        return model.getGradient(localtime: model.mainInfo.localTime,
                                 sunrise: model.astrologyModel.sun.riseTime,
                                 sunset: model.astrologyModel.sun.setTime) == .night ? .getEquivalentOpaqueColor(opacity: 1, color: ModeColors.darkBackground) : .getEquivalentOpaqueColor(opacity: 1, color: ModeColors.lightBackground)
    }
}

struct MCurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(model: CurrentWeatherModel(entity: WeatherEntity(location: nil, current: nil, forecast: nil)), isFromSearch: false)
            .background(.cyan)
    }
}
