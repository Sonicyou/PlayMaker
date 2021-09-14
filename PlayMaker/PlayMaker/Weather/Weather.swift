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
    var sunrise: String = ""
    var sunset: String = ""
    let city_name: String?
    var temp: Double = .zero
    let weather: WeatherImage?
}

struct WeatherImage: Codable {
    let icon: String?
    let description: String?
}


