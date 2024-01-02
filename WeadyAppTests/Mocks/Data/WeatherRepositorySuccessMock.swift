//
//  WeatherRepositorySuccessMock.swift
//  WeadyAppTests
//
//  Created by Alex Lin on 15/1/23.
//

import Foundation
import Combine
@testable import WeadyApp

extension CurrentWeatherUseCaseSuccessMock {
    
    final class DefaultCurrentRepositorySuccessMock: CurrentWeatherRepositoryProtocol {
        
        func fetchCurrentWeatherMock() -> AnyPublisher<Data, Error> {
               Future { promise in
                   promise(.success(WeatherSuccessDecodableJsonMock.makeJsonMock()))
               }
               .eraseToAnyPublisher()
           }
      
        func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherDecodable, Error> {
            return fetchCurrentWeatherMock()
                .decode(type: WeatherDecodable.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    }
}

//extension CurrentWeatherUseCaseSuccessMock: CurrentWeatherUseCaseProtocol {
//
//    func fetchCurrentWeatherMock() -> AnyPublisher<Data, Error> {
//           Future { promise in
//               promise(.success(WeatherSuccessDecodableJsonMock.makeJsonMock()))
//           }
//           .eraseToAnyPublisher()
//       }
//
//    func getCurrentWeather(query: String, aqi: String) -> AnyPublisher<WeatherEntity, Error> {
//        <#code#>
//    }
//
    
    
//    func execute(parameters: MVVM.CharacterComicsUseCaseParameters?, completion: @escaping (Result<[MVVM.ComicEntity], SKRools.SKError>) -> Void) {
//        let decoder = JSONDecoder()
//        let json = ComicDataWrapperJsonMock.makeJsonMock()
//        do {
//            let decodable = try decoder.decode(ComicDataWrapperDecodable.self, from: json)
//            if let entity = decodable.data?.results?.map({ ComicEntity(decodable: $0) }) {
//                completion(.success(entity))
//            } else {
//                completion(.failure(SKError.emptyData))
//            }
//        } catch let error {
//            SKLogger.shared.log(error: error, endpoint: nil, data: json, group: .parse)
//            completion(.failure(SKError.parseError(msg: error.localizedDescription)))
//        }
//    }
//}
