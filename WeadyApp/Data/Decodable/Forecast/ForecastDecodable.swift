//
//  ForecastDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation

struct ForecastDecodable: Codable {
    let forecastDay: [ForecastDayDecodable]?
    
    enum CodingKeys: String, CodingKey {
        case forecastDay = "forecastday"
    }
}
