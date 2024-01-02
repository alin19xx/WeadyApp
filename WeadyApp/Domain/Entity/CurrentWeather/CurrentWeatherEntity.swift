//
//  CurrentWeatherEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

struct CurrentWeatherEntity {
    let lastUpdate: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Int?
    let condition: ConditionEntity?
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
    let airQuality: AirQualityEntity?
    
    init(decodable: CurrentWeatherDecodable?) {
        self.lastUpdate = decodable?.lastUpdate
        self.tempC = decodable?.tempCelcius
        self.tempF = decodable?.tempFarenheit
        self.isDay = decodable?.isDay
        self.condition = ConditionEntity(decodable: decodable?.condition)
        self.windSpeedMph = decodable?.windSpeedMph
        self.windSpeedKph = decodable?.windSpeedKph
        self.windDegrees = decodable?.windDegrees
        self.windDir = decodable?.windDir
        self.preassureMb = decodable?.preassureMb
        self.preassureIn = decodable?.preassureIn
        self.precipMm = decodable?.precipMm
        self.precipIn = decodable?.precipIn
        self.humidity = decodable?.humidity
        self.cloud = decodable?.cloud
        self.feelsLikeC = decodable?.feelsLikeC
        self.feelsLikeF = decodable?.feelsLikeF
        self.visKmh = decodable?.visKmh
        self.visMph = decodable?.visMph
        self.uv = decodable?.uv
        self.gustMph = decodable?.gustMph
        self.gustKph = decodable?.gustKph
        self.airQuality = AirQualityEntity(decodable: decodable?.airQuality)
    }
}
