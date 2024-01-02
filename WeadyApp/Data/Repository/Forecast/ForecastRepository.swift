//
//  ForecastRepository.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation
import Combine

protocol ForecastRepositoryProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func getForecast(query: String, days: Int, aqi: String, alerts: String) -> AnyPublisher<WeatherDecodable, Error>
}

final class DefaultForecastRepository: ForecastRepositoryProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getForecast(query: String, days: Int, aqi: String, alerts: String) -> AnyPublisher<WeatherDecodable, Error> {
        let endpoint = Endpoint.forecast(query: query, days: days, aqi: aqi, alerts: alerts)
        debugPrint(endpoint)
        
        return networker.get(type: WeatherDecodable.self,
                             url: endpoint.url,
                             headers: endpoint.headers)
    }
}
