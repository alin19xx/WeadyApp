//
//  DayEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct DayEntity {
    let maxTempC: Double?
    let maxTempF: Double?
    let minTempC: Double?
    let minTempF: Double?
    let avgTempC: Double?
    let avgTempF: Double?
    let maxWindMph: Double?
    let maxWindKph: Double?
    let totalPrecipMm: Double?
    let totalPrecipIn: Double?
    let avgVisKph: Double?
    let avgVisMph: Double?
    let avgHumidity: Double?
    let willItRain: Int?
    let chanceOfRain: Int?
    let willItSnow: Int?
    let chanceOfSnow: Int?
    let condition: ConditionEntity?
    let uv: Double?
    
    init(decodable: DayDecodable?) {
        self.maxTempC = decodable?.maxTempC
        self.maxTempF = decodable?.maxTempF
        self.minTempC = decodable?.minTempC
        self.minTempF = decodable?.minTempF
        self.avgTempC = decodable?.avgTempC
        self.avgTempF = decodable?.avgTempF
        self.maxWindMph = decodable?.maxWindMph
        self.maxWindKph = decodable?.maxWindKph
        self.totalPrecipMm = decodable?.totalPrecipMm
        self.totalPrecipIn = decodable?.totalPrecipIn
        self.avgVisKph = decodable?.avgVisKph
        self.avgVisMph = decodable?.avgVisMph
        self.avgHumidity = decodable?.avgHumidity
        self.willItRain = decodable?.willItRain
        self.chanceOfRain = decodable?.chanceOfRain
        self.willItSnow = decodable?.willItSnow
        self.chanceOfSnow = decodable?.chanceOfSnow
        self.condition = ConditionEntity(decodable: decodable?.condition)
        self.uv = decodable?.uv
    }
}
