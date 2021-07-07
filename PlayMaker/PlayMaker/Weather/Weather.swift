//
//  Weather.swift
//  PlayMaker
//
//  Created by Артем Фролов on 02.08.2021.
//

import Foundation

struct WeatherResponse: Codable {
    let data: [Weather]
}

struct Weather: Codable {
    let sunrise: String?
    let sunset: String?
    let city_name: String?
    let temp: String?
    let weather: WeatherImage?
}

struct WeatherImage: Codable {
    let icon: String?
    let description: String?
}


