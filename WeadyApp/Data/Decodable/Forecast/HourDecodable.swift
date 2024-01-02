//
//  HourDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct HourDecodable: Codable {
    let timeEpoch: Int?
    let time: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Int?
    let condition: ConditionDecodable?
    let windSpeedMph: Double?
    let windSpeedKph: Double?
    let windDegree: Int?
    let windDir: String?
    // Pressure in milibars
    let preassureMb: Double?
    let preassureIn: Double?
    let humidity: Int?
    // Cloud cover percentatge
    let cloud: Int?
    // Feels like in degrees
    let feelsLikeC: Double?
    // Feels like in farenheit
    let feelsLikeF: Double?
    let windChillC: Double?
    let windChillF: Double?
    let heatIndexC: Double?
    let heatIndexF: Double?
    let dewPointC: Double?
    let dewPointF: Double?
    let willItRain: Int?
    let chanceOfRain: Int?
    let willItSnow: Int?
    let chanceOfSnow: Int?
    // Visibility in km
    let visKmh: Double?
    // Visibility in miles
    let visMph: Double?
    // Gust -> "racha"
    let gustMph: Double?
    let gustKph: Double?
    // UV Index
    let uv: Double?
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windSpeedMph = "wind_mph"
        case windSpeedKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case preassureMb = "pressure_mb"
        case preassureIn = "pressure_in"
        case humidity
        case cloud
        case feelsLikeC = "feelslike_c"
        case feelsLikeF = "feelslike_f"
        case windChillC = "windchill_c"
        case windChillF = "windchill_f"
        case heatIndexC = "heatindex_c"
        case heatIndexF = "heatindex_f"
        case dewPointC = "dewpoint_c"
        case dewPointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case visKmh = "vis_km"
        case visMph = "vis_miles"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}
