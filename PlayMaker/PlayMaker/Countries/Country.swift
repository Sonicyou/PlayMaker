//
//  City.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import Foundation

struct CityResponse: Codable {
    let data: [Country]
}

struct Country: Codable {
    let country: String?
    let cities: [String]
}


