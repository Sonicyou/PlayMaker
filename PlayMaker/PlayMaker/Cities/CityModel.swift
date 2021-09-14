//
//  CityModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import Foundation

class CityModel {
    
    let cities: [String]
    let router: CityRouter
    private let networkService: NetworkServiceProtocol
    
    init(router: CityRouter, cities: [String], networkService: NetworkServiceProtocol) {
        self.cities = cities
        self.router = router
        self.networkService = networkService
    }
}
