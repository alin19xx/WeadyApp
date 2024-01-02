//
//  CurrentWeatherRepository.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation
import Combine

protocol CurrentWeatherRepositoryProtocol: AnyObject {
//    var networker: NetworkerProtocol { get }
    func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherDecodable, Error>
}

final class DefaultCurrentWeatherRepository: CurrentWeatherRepositoryProtocol {
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherDecodable, Error> {
        let endpoint = Endpoint.currentWeather(query: query,
                                               aqi: aqi)
        debugPrint(endpoint)
        
        return networker.get(type: WeatherDecodable.self,
                             url: endpoint.url,
                             headers: endpoint.headers)
    }
}
