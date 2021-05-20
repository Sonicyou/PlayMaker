//
//  CitiesAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import UIKit

class CitiesAssembly: BaseAssembly {
    
    func build() -> UIViewController {
        let router = CitiesRouter()
        let citiesModel = CitiesModel()
        let citiesVC = CitiesViewController(model: citiesModel)
        router.citiesViewController = citiesVC
        return citiesVC
    }
}
