//
//  WeatherModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import Foundation

class WeatherModel {
    
    private let weatherRouter: WeatherRouter
    private let networkService: NetworkServiceProtocol
    
    init(weatherRouter: WeatherRouter, networkService: NetworkServiceProtocol) {
        self.weatherRouter = weatherRouter
        self.networkService = networkService
    }
    
    func getWeather(complition: @escaping (Weather?) -> ())  {
        networkService.getWeather { result in
            switch result {
            case .success(let weather):
                complition(weather)
            case .failure(let error):
                print(error)
            }
        }
    }
}
