//
//  WeatherDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct WeatherDecodable: Codable {
    let location: LocationDecodable?
    let current: CurrentWeatherDecodable?
    let forecast: ForecastDecodable?
}
