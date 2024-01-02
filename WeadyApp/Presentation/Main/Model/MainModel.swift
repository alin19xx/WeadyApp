//
//  MainModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 20/10/22.
//

import Foundation

struct MainWeatherModel: Identifiable {
    
    let id = UUID()
    let mainInfo: CurrentWeatherModel
    
    init(entity: WeatherEntity) {
        self.mainInfo = CurrentWeatherModel(entity: entity)
    }
}

//    let locations = [ItemModel(location: "Barcelona",
//                                                     tempC: 20,
//                                                     tempF: 76,
//                                                     icon: "partly_cloudy_icon",
//                                                     isDay: true,
//                                                     windSpeedMph: 8,
//                                                     windSpeedKph: 14,
//                                                     precipMm: 0,
//                                                     precipIn: 0,
//                                                     humidity: 20),
//                     ItemModel(location: "Barcelona",
//                                                                      tempC: 20,
//                                                                      tempF: 76,
//                                                                      icon: "partly_cloudy_icon",
//                                                                      isDay: true,
//                                                                      windSpeedMph: 8,
//                                                                      windSpeedKph: 14,
//                                                                      precipMm: 0,
//                                                                      precipIn: 0,
//                                                                      humidity: 20),
//                     ItemModel(location: "Barcelona",
//                                                                      tempC: 20,
//                                                                      tempF: 76,
//                                                                      icon: "partly_cloudy_icon",
//                                                                      isDay: true,
//                                                                      windSpeedMph: 8,
//                                                                      windSpeedKph: 14,
//                                                                      precipMm: 0,
//                                                                      precipIn: 0,
//                                                                      humidity: 20)]
