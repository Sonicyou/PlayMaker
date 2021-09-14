//
//  CityAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import UIKit
class CityAssembly: BaseAssembly {
    func build(cities: [String]) -> CityViewController {
        let router = CityRouter()
        let cityModel = CityModel(router: router, cities: cities, networkService: serviceFactory.network)
        let cityVC = CityViewController(model: cityModel)
        return cityVC
    }
}
