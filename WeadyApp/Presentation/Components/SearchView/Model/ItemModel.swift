//
//  ItemModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 25/10/22.
//

import Foundation

struct ItemModel: Hashable {
    let location: String
    let tempC: Double
    let tempF: Double
    let icon: String
    let isDay: Bool
    let windSpeedMph: Int
    let windSpeedKph: Int
    let precipMm: Int
    let precipIn: Int
    let humidity: Int
    
    
    init(entity: WeatherEntity) {
        self.location = entity.location?.name ?? ""
        self.tempC = entity.current?.tempC ?? 0
        self.tempF = entity.current?.tempF ?? 0
        self.icon = entity.current?.condition?.icon ?? ""
        self.isDay = ((entity.current?.isDay) != nil)
        self.windSpeedMph = Int(entity.current?.windSpeedMph ?? 0)
        self.windSpeedKph = Int(entity.current?.windSpeedKph ?? 0)
        self.precipMm = Int(entity.current?.precipMm ?? 0)
        self.precipIn = Int(entity.current?.precipIn ?? 0)
        self.humidity = entity.current?.humidity ?? 0
    }
    
    init() {
        self.location = ""
        self.tempC = 0
        self.tempF = 0
        self.icon = ""
        self.isDay = true
        self.windSpeedMph = 0
        self.windSpeedKph = 0
        self.precipMm = 0
        self.precipIn = 0
        self.humidity = 0
    }
}
