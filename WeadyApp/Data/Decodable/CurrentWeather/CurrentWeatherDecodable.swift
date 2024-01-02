//
//  CurrentWeatherDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

/*
 "current": {
    "last_updated_epoch": 1665737100,
    "last_updated": "2022-10-14 10:45",
    "temp_c": 21.9,
    "temp_f": 71.4,
    "is_day": 1,
    "condition": {
        "text": "Sunny",
        "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
        "code": 1000
    },
    "wind_mph": 6.0,
    "wind_kph": 9.7,
    "wind_degree": 310,
    "wind_dir": "NW",
    "pressure_mb": 1021.0,
    "pressure_in": 30.15,
    "precip_mm": 0.0,
    "precip_in": 0.0,
    "humidity": 57,
    "cloud": 6,
    "feelslike_c": 21.9,
    "feelslike_f": 71.4,
    "vis_km": 10.0,
    "vis_miles": 6.0,
    "uv": 6.0,
    "gust_mph": 8.5,
    "gust_kph": 13.7
 }
 */

struct CurrentWeatherDecodable: Codable {
    let lastUpdate: String?
    let tempCelcius: Double?
    let tempFarenheit: Double?
    let isDay: Int?
    let condition: ConditionDecodable?
    let windSpeedMph: Double?
    let windSpeedKph: Double?
    let windDegrees: Int?
    let windDir: String?
    // Pressure in milibars
    let preassureMb: Double?
    let preassureIn: Double?
    // Precipitation in milimiters
    let precipMm: Double?
    let precipIn: Double?
    let humidity: Int?
    // Cloud cover percentatge
    let cloud: Int?
    // Feels like in degrees
    let feelsLikeC: Double?
    // Feels like in farenheit
    let feelsLikeF: Double?
    // Visibility in km
    let visKmh: Double?
    // Visibility in miles
    let visMph: Double?
    // UV Index
    let uv: Double?
    // Gust -> "racha"
    let gustMph: Double?
    let gustKph: Double?
    let airQuality: AirQualityDecodable?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdate = "last_updated"
        case tempCelcius = "temp_c"
        case tempFarenheit = "temp_f"
        case isDay
        case condition
        case windSpeedMph = "wind_mph"
        case windSpeedKph = "wind_kph"
        case windDegrees = "wind_degree"
        case windDir = "wind_dir"
        case preassureMb = "pressure_mb"
        case preassureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud
        case feelsLikeC = "feelslike_c"
        case feelsLikeF = "feelslike_f"
        case visKmh = "vis_km"
        case visMph = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case airQuality = "air_quality"
    }
}
