//
//  ForecastUseCase.swift
//  WeadyApp
//
//  Created by Alex Lin on 14/10/22.
//

import Foundation
import Combine

protocol ForecastUseCaseProtocol: AnyObject {
    func getForecast(query: String, days: Int, aqi: String, alerts: String) -> AnyPublisher<WeatherEntity, Error>
}

final class DefaultForecastUseCase: ForecastUseCaseProtocol {
    private let repository: ForecastRepositoryProtocol
    
    init(repository: ForecastRepositoryProtocol = DefaultForecastRepository()) {
        self.repository = repository
    }
    
    func getForecast(query: String, days: Int, aqi: String, alerts: String) -> AnyPublisher<WeatherEntity, Error> {
        return repository.getForecast(query: query, days: days, aqi: aqi, alerts: alerts)
            .map { decodable in
                WeatherEntity(location: LocationEntity(decodable: decodable.location) ,
                              current: CurrentWeatherEntity(decodable: decodable.current),
                              forecast: ForecastEntity(decodable: decodable.forecast))
            }
            .eraseToAnyPublisher()
    }
}
