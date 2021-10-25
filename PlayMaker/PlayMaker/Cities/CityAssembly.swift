//
//  CityAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import UIKit

class CityAssembly: BaseAssembly {
    
    func build(cities: [String], cityCompletion: StringCompletion?) -> CityViewController { 
        let router = CityRouter()
        let cityModel = CityModel(
            router: router,
            cities: cities,
            networkService: serviceFactory.network,
            userDefaults: serviceFactory.defaults
        )
        let cityVC = CityViewController(model: cityModel)
        router.cityViewController = cityVC
        cityVC.cityCompletion = cityCompletion
        return cityVC
    }
}
