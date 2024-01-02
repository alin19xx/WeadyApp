//
//  CurrentWeatherUseCaseSuccess+Mock.swift
//  WeadyAppTests
//
//  Created by Alex Lin on 15/1/23.
//

import Foundation
import Combine
@testable import WeadyApp

final class CurrentWeatherUseCaseSuccessMock: CurrentWeatherUseCaseProtocol {
    
    func fetchCurrentWeatherMock() -> AnyPublisher<Data, Error> {
           Future { promise in
               promise(.success(WeatherSuccessDecodableJsonMock.makeJsonMock()))
           }
           .eraseToAnyPublisher()
       }
  
    func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherEntity, Error> {
        return fetchCurrentWeatherMock()
            .decode(type: WeatherDecodable.self, decoder: JSONDecoder())
            .map({ decocdable in
                WeatherEntity(location: LocationEntity(decodable: decocdable.location),
                              current: CurrentWeatherEntity(decodable: decocdable.current),
                              forecast: nil)
            })
            .eraseToAnyPublisher()
    }
    

}
