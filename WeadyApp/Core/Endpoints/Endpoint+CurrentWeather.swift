//
//  Endpoint+CurrentWeather.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation

extension Endpoint {
    
    static func currentWeather(query: String, aqi: String) -> Self {
        return Endpoint(path: "/current.json", queryItems: [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "aqi", value: aqi)
        ])
    }
    
    static func forecast(query: String, days: Int, aqi: String, alerts: String) -> Self {
        return Endpoint(path: "/forecast.json", queryItems: [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "days", value: "\(days)"),
            URLQueryItem(name: "aqi", value: aqi),
            URLQueryItem(name: "alerts", value: alerts),
        ])
    }
    
}
