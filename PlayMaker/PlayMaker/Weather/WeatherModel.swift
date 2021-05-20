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
    
    func getWeather() {
        networkService.getWeather()
    }
}
