//
//  ForecastEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct ForecastEntity {
    let forecastDay: [ForecastDayEntity]?
    
    init(decodable: ForecastDecodable?) {
        
        var forecastArray = [ForecastDayEntity]()
        decodable?.forecastDay?.forEach({ decodable in
            forecastArray.append(ForecastDayEntity(decodable: decodable))
        })
        self.forecastDay = forecastArray
    }
}
