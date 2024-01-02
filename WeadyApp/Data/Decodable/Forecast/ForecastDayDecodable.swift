//
//  ForecastDayDecodable.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct ForecastDayDecodable: Codable {
    let date: String?
    let dateEpoch: Int?
    let day: DayDecodable?
    let astro: AstroDecodable?
    let hour: [HourDecodable]?
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
        case astro
        case hour
    }
}
