//
//  DayDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct DayDecodable: Codable {
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
    let condition: ConditionDecodable?
    let uv: Double?
    
    enum CodingKeys: String, CodingKey {
        case maxTempC = "maxtemp_c"
        case maxTempF = "maxtemp_f"
        case minTempC = "mintemp_c"
        case minTempF = "mintemp_f"
        case avgTempC = "avgtemp_c"
        case avgTempF = "avgtemp_f"
        case maxWindMph = "maxwind_mph"
        case maxWindKph = "maxwind_kph"
        case totalPrecipMm = "totalprecip_mm"
        case totalPrecipIn = "totalprecip_in"
        case avgVisKph = "avgvis_km"
        case avgVisMph = "avgvis_miles"
        case avgHumidity = "avghumidity"
        case willItRain = "daily_will_it_rain"
        case chanceOfRain = "daily_chance_of_rain"
        case willItSnow = "daily_will_it_snow"
        case chanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv = "uv"
    }
}
