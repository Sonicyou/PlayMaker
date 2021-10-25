//
//  CitiesRouter.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import Foundation

class CountryRouter {
    weak var countryViewController: CountryViewController?
    var cityCompletion: StringCompletion?
    
    func showCities(cities: [String]) {
        let cityVC = CityAssembly().build(cities: cities, cityCompletion: cityCompletion)
        countryViewController?.navigationController?.pushViewController(cityVC, animated: true)
    }
}
