//
//  MainViewModel.swift
//  WeadyApp
//
//  Created by Alex Lin on 22/10/22.
//

import Foundation
import Combine
import SwiftUI

class MainWeatherViewModel: ObservableObject {
    
    @Published private var locationManager = LocationManager.shared
    
    private var suggestions = ["Barcelona", "Sevilla", "Madrid", "Bilbao", "Valencia"]
    
    private var currentUseCase: CurrentWeatherUseCaseProtocol
    private var forecastUseCase: ForecastUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var model: [MainWeatherModel] = [MainWeatherModel]()
    @Published var modelSearch: MainWeatherModel?
    @Published var suggestionsModel = [ItemModel]()
    @Published var viewState: ViewState = .loading
    
    init(currentUseCase: CurrentWeatherUseCaseProtocol = DefaultCurrentWeatherUseCase(),
         forecastUseCase: ForecastUseCaseProtocol = DefaultForecastUseCase()) {
        self.currentUseCase = currentUseCase
        self.forecastUseCase = forecastUseCase
        
        self.locationManager.requestLocation()
    }
    
    // MARK: - Methods
    
    func onAppear() {
        // TODO: - Check if location i not accessible
        guard let latitude = locationManager.userLocation?.coordinate.latitude.description,
              let longitude = locationManager.userLocation?.coordinate.longitude.description else { return }
        
        let currentLocation = "\(latitude),\(longitude)"
        getMainWeather(query: currentLocation)
        getcurrentSuggestions(currentSuggestion: suggestions.first ?? "")
    }
    
    // MARK: - Private methods
    
    private func getMainWeather(query: String) {
        withAnimation { self.viewState = .loading }
        forecastUseCase.getForecast(query: query, days: 2, aqi: "yes", alerts: "yes")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.viewState = .error
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] current in
                guard let self = self else { return }
                self.model.append(MainWeatherModel(entity: current))
                self.getSecondLocation()
                withAnimation {
                    self.viewState = .content(suggestions: nil,
                                              current: self.model, index: 0)
                }
            }
            .store(in: &cancellables)
    }
    
    private func getSecondLocation() {
        forecastUseCase.getForecast(query: "Los Angeles", days: 2, aqi: "yes", alerts: "yes")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.viewState = .error
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] current in
                guard let self = self else { return }
                self.model.append(MainWeatherModel(entity: current))
                self.getThirdLocation()
            }
            .store(in: &cancellables)
    }
    
    private func getThirdLocation() {
        forecastUseCase.getForecast(query: "Barcelona", days: 2, aqi: "yes", alerts: "yes")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.viewState = .error
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] current in
                guard let self = self else { return }
                self.model.append(MainWeatherModel(entity: current))
                self.getFourthLocation()
            }
            .store(in: &cancellables)
    }
    
    private func getFourthLocation() {
        forecastUseCase.getForecast(query: "Singapur", days: 2, aqi: "yes", alerts: "yes")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.viewState = .error
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] current in
                guard let self = self else { return }
                self.model.append(MainWeatherModel(entity: current))
            }
            .store(in: &cancellables)
    }
    
    
    private func getcurrentSuggestions(currentSuggestion: String) {
        currentUseCase.getCurrentWeather(query: currentSuggestion, aqi: "no")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    print("hola")
                case .finished: break
                }
            } receiveValue: { [weak self] searchEntity in
                guard let self = self else { return }
                self.suggestionsModel.append(ItemModel(entity: searchEntity))
                if self.suggestionsModel.count < 5 {
                    self.getcurrentSuggestions(currentSuggestion: self.suggestions[self.suggestionsModel.count])
                }
            }
            .store(in: &cancellables)
    }
    
    func getSearchLocation(query: String) {
        forecastUseCase.getForecast(query: query, days: 2, aqi: "yes", alerts: "yes")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.viewState = .error
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] current in
                guard let self = self else { return }
                self.modelSearch = MainWeatherModel(entity: current)
            }
            .store(in: &cancellables)
    }
}
