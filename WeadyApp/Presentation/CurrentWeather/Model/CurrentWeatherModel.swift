//
//  MainWeatherModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 13/10/22.
//

import Foundation

struct CurrentWeatherModel {
    let mainInfo: MainInfoModel
    let forecastModel: [ForecastModel]
    let currentModel: CurrentInfoModel
    let astrologyModel: AstrologyModel
    
    init(entity: WeatherEntity) {
        self.mainInfo = MainInfoModel(icon: "",
                                      city: entity.location?.name ?? "",
                                      tempCelcius: entity.current?.tempC ?? 0,
                                      tempFarenheit: entity.current?.tempF ?? 0,
                                      localTime: entity.location?.localtime ?? "")
        
        var forecastArray = [ForecastModel]()
        entity.forecast?.forecastDay?.forEach({ dayEntity in
            dayEntity.hour?.forEach({ hourEntity in
                if let image = hourEntity.condition?.code {
                    forecastArray.append(ForecastModel(time: String(hourEntity.time?.suffix(4) ?? ""),
                                                       icon: "\(image)",
                                                       maxTempCelcius: hourEntity.tempC ?? 0,
                                                       maxtempFarenheit: hourEntity.tempF ?? 0))
                }
                
            })
            
        })
        
        self.forecastModel = forecastArray
        self.currentModel = CurrentInfoModel(entity: entity.current)
        self.astrologyModel = AstrologyModel(sun: AstroModel(titleRise: "Sunrise",
                                                             riseTime: entity.forecast?.forecastDay?.first?.astro?.sunrise ?? "",
                                                             titleSet: "Sunset",
                                                             setTime: entity.forecast?.forecastDay?.first?.astro?.sunset ?? ""),
                                             moon: AstroModel(titleRise: "Moonrise",
                                                              riseTime: entity.forecast?.forecastDay?.first?.astro?.moonrise ?? "",
                                                              titleSet: "Moonset",
                                                              setTime: entity.forecast?.forecastDay?.first?.astro?.moonset ?? ""))
    }
    
    func getGradient(localtime: String, sunrise: String, sunset: String) -> WeatherGradient {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let nowStringCustom = convertCurrentLocaltime(localtime)

        if nowStringCustom < convertTo24hFormat(sunset), nowStringCustom > convertTo24hFormatAddingRange(sunset, isNegative: true) {
            return .afternoon
        } else if nowStringCustom > convertTo24hFormat(sunrise), nowStringCustom < convertTo24hFormatAddingRange(sunrise, isNegative: false) {
            return .morning
        } else if nowStringCustom > convertTo24hFormat(sunset) || nowStringCustom < convertTo24hFormat(sunrise) {
            return .night
        } else {
            return .halfDay
        }
    }
    
    func convertCurrentLocaltime(_ localtime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        
        let date = dateFormatter.date(from: localtime)
        dateFormatter.dateFormat = "HH:mm a"
        
        let date24 = dateFormatter.string(from: date ?? .now)
        return convertTo24hFormat(date24)
    }
    
    func convertTo24hFormat(_ amFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        let date = dateFormatter.date(from: amFormat)
        dateFormatter.dateFormat = "HH:mm"
        
        let date24 = dateFormatter.string(from: date ?? Date.now)
        return date24
    }

    func convertTo24hFormatAddingRange(_ amFormat: String, isNegative: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        let date = dateFormatter.date(from: amFormat)?.addingTimeInterval(isNegative ? -7200 : 7200)
        dateFormatter.dateFormat = "HH:mm"
        
        let date24 = dateFormatter.string(from: date ?? Date.now)
        return date24
    }
}
