//
//  NetworkService.swift
//  PlayMaker
//
//  Created by Артем Фролов on 20.05.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews()
    func getWeather()
}

class NetworkService: NetworkServiceProtocol {
    func getNews() {
        print("news")//TODO: change
    }
    
    func getWeather() {
        print("weather")//TODO: change
    }
}
