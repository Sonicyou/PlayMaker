//
//  CitiesAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import UIKit

class CountryAssembly: BaseAssembly {
    
    func build(cityCompletion: StringCompletion?) -> CountryViewController {
        let router = CountryRouter()
        let citiesModel = CountryModel(router: router, networkService: serviceFactory.network)
        let citiesVC = CountryViewController(model: citiesModel)
        router.countryViewController = citiesVC
        router.cityCompletion = cityCompletion
        return citiesVC
    }
}
