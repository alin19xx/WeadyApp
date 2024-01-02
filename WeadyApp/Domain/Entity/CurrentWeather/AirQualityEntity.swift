//
//  AirQualityEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 12/10/22.
//

import Foundation

/*
 "air_quality": {
     "co": 247.0,
     "no2": 11.699999809265137,
     "o3": 80.0999984741211,
     "so2": 1.600000023841858,
     "pm2_5": 5.199999809265137,
     "pm10": 6.199999809265137,
     "us-epa-index": 1,
     "gb-defra-index": 1
 }
 */

struct AirQualityEntity {
    let co: Double?
    let no2: Double?
    let o3: Double?
    let so2: Double?
    let pm2_5: Double?
    let pm10: Double?
    let us_epa_index: Double?
    let gb_defra_index: Double?
    
    init(decodable: AirQualityDecodable?) {
        self.co = decodable?.co
        self.no2 = decodable?.no2
        self.o3 = decodable?.o3
        self.so2 = decodable?.so2
        self.pm2_5 = decodable?.pm2_5
        self.pm10 = decodable?.pm10
        self.us_epa_index = decodable?.us_epa_index
        self.gb_defra_index = decodable?.gb_defra_index
    }
}
