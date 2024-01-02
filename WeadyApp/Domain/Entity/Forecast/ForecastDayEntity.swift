//
//  ForecastDayEntity.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation

struct ForecastDayEntity {
    let date: String?
    let dateEpoch: Int?
    let day: DayEntity?
    let astro: AstroEntity?
    let hour: [HourEntity]?
    
    init(decodable: ForecastDayDecodable?) {
        self.date = decodable?.date
        self.dateEpoch = decodable?.dateEpoch
        self.day = DayEntity(decodable: decodable?.day)
        self.astro = AstroEntity(decodable: decodable?.astro)
        
        var hourArray = [HourEntity]()
        decodable?.hour?.forEach({ decodable in
            hourArray.append(HourEntity(decodable: decodable))
        })
        self.hour = hourArray
    }
    
    func dateTimeChangeFormat(str stringWithDate: String, inDateFormat: String, outDateFormat: String) -> String {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.dateFormat = inDateFormat

        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.dateFormat = outDateFormat

        let inStr = stringWithDate
        let date = inFormatter.date(from: inStr)!
        return outFormatter.string(from: date)
    }
}
