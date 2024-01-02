//
//  HourEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct HourEntity {
    let timeEpoch: Int?
    let time: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Int?
    let condition: ConditionEntity?
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
    
    init(decodable: HourDecodable?) {
        self.timeEpoch = decodable?.timeEpoch
        self.time = decodable?.time
        self.tempC = decodable?.tempC
        self.tempF = decodable?.tempF
        self.isDay = decodable?.isDay
        self.condition = ConditionEntity(decodable: decodable?.condition)
        self.windSpeedMph = decodable?.windSpeedMph
        self.windSpeedKph = decodable?.windSpeedKph
        self.windDegree = decodable?.windDegree
        self.windDir = decodable?.windDir
        self.preassureMb = decodable?.preassureMb
        self.preassureIn = decodable?.preassureIn
        self.humidity = decodable?.humidity
        self.cloud = decodable?.cloud
        // Feels like in degrees
        self.feelsLikeC = decodable?.feelsLikeC
        // Feels like in farenheit
        self.feelsLikeF = decodable?.feelsLikeF
        self.windChillC = decodable?.windChillC
        self.windChillF = decodable?.windChillF
        self.heatIndexC = decodable?.heatIndexC
        self.heatIndexF = decodable?.heatIndexF
        self.dewPointC = decodable?.dewPointC
        self.dewPointF = decodable?.dewPointF
        self.willItRain = decodable?.willItRain
        self.chanceOfRain = decodable?.chanceOfRain
        self.willItSnow = decodable?.willItSnow
        self.chanceOfSnow = decodable?.chanceOfSnow
        self.visKmh = decodable?.visKmh
        self.visMph = decodable?.visMph
        self.gustMph = decodable?.gustMph
        self.gustKph = decodable?.gustKph
        self.uv = decodable?.uv
    }
}
