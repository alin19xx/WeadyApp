//
//  CurrentWeatherUseCase.swift
//  WeadyApp
//
//  Created by Alex Lin on 7/10/22.
//

import Foundation
import Combine

protocol CurrentWeatherUseCaseProtocol: AnyObject {
    func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherEntity, Error>
}

final class DefaultCurrentWeatherUseCase: CurrentWeatherUseCaseProtocol {
    private let repository: CurrentWeatherRepositoryProtocol
    
    init(repository: CurrentWeatherRepositoryProtocol = DefaultCurrentWeatherRepository()) {
        self.repository = repository
    }
    
    func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherEntity, Error> {
        return repository.getCurrentWeather(query: query, aqi: aqi)
            .map({ decocdable in
                WeatherEntity(location: LocationEntity(decodable: decocdable.location),
                              current: CurrentWeatherEntity(decodable: decocdable.current),
                              forecast: nil)
            })
            .eraseToAnyPublisher()
    }
}
