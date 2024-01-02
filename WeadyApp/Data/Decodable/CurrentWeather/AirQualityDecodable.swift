//
//  AirQualityDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 12/10/22.
//

import Foundation

struct AirQualityDecodable: Codable {
    let co: Double?
    let no2: Double?
    let o3: Double?
    let so2: Double?
    let pm2_5: Double?
    let pm10: Double?
    let us_epa_index: Double?
    let gb_defra_index: Double?
    
    enum CodingKeys: String, CodingKey {
        case co
        case no2
        case o3
        case so2
        case pm2_5
        case pm10
        case us_epa_index = "us-epa-index"
        case gb_defra_index = "gb-defra-index"
    }
}
