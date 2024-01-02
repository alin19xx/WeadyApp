//
//  CurrentWeatherInfoModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation

struct CurrentInfoModel {
    let windSpeedMph: Int
    let windSpeedKph: Int
    let uv: Int
    let precipMm: Int
    let precipIn: Int
    let humidity: Int
    let airQuality: Int
    
    init(entity: CurrentWeatherEntity?) {
        self.windSpeedKph = Int(entity?.windSpeedKph ?? 0)
        self.windSpeedMph = Int(entity?.windSpeedMph ?? 0)
        self.humidity = entity?.humidity ?? 0
        self.uv = Int(entity?.uv ?? 0)
        self.precipMm = Int(entity?.precipMm ?? 0)
        self.precipIn = Int(entity?.precipIn ?? 0)
        self.airQuality = 3
    }
    
    init(windSpeedMph: Double?, windSpeedKph: Double?, uv: Double?, precipMm: Double?, precipIn: Double?, humidity: Int?, aq: Int?) {
        self.windSpeedKph = Int(windSpeedKph ?? 0)
        self.windSpeedMph = Int(windSpeedMph ?? 0)
        self.humidity = humidity ?? 0
        self.uv = Int(uv ?? 0)
        self.precipMm = Int(precipMm ?? 0)
        self.precipIn = Int(precipIn ?? 0)
        self.airQuality = aq ?? 0
    }
}

struct AirQualityModel {
    let co: Double?
    let no2: Double?
    let o3: Double?
    let so2: Double?
    let pm2_5: Double?
    let pm10: Double?
    let us_epa_index: Double?
    let gb_defra_index: Double?
    
    init(entity: AirQualityEntity?) {
        self.co = entity?.co
        self.no2 = entity?.no2
        self.o3 = entity?.o3
        self.so2 = entity?.so2
        self.pm2_5 = entity?.pm2_5
        self.pm10 = entity?.pm10
        self.us_epa_index = entity?.us_epa_index
        self.gb_defra_index = entity?.gb_defra_index
    }
}
