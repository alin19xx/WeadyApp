//
//  CurrentWeatherUseCase+Test.swift
//  WeadyAppTests
//
//  Created by Alex Lin on 16/1/23.
//

import XCTest
import Combine
@testable import WeadyApp

final class CurrentWeatherUseCase_Test: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharactersComicListUseCaseSuccess() {
        let expt = self.expectation(description: "A collection of comics is downloaded and parsed.")
        // GIVEN
        // Create mocked repository success response
        let repository = CurrentWeatherUseCaseSuccessMock.DefaultCurrentRepositorySuccessMock()
        // Inject the mocked repository into the useCase
        let useCase: DefaultCurrentWeatherUseCase = DefaultCurrentWeatherUseCase(repository: repository)
        //        let params = CharacterComicsUseCaseParameters(characterId: "fake")
        
        // WHEN
        useCase.getCurrentWeather(query: "", aqi: "")
        // THEN
            .sink(
                receiveCompletion: { completion in
                    expt.fulfill() },
                receiveValue: { value in
                    XCTAssertEqual(value.location?.country, "Spain")
                    XCTAssertEqual(value.location?.country, "Spain")
                    XCTAssertEqual(value.location?.country, "Spain")
                    XCTAssertEqual(value.location?.country, "Spain")
                    XCTAssertEqual(value.location?.country, "Spain")
                    XCTAssertEqual(value.location?.country, "Spain") // Compare with your fake json file
                })
            .store(in: &cancellables)
        
        wait(for: [expt], timeout: 0.1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
