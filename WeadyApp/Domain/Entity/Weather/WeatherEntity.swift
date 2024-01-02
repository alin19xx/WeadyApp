//
//  WeatherEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct WeatherEntity {
    let location: LocationEntity?
    let current: CurrentWeatherEntity?
    let forecast: ForecastEntity?
}
