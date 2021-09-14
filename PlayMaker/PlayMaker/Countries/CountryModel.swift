//
//  CountryModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import Foundation

class CountryModel {
    
    let router: CountryRouter
    private let networkService: NetworkServiceProtocol
    
    init(router: CountryRouter, networkService: NetworkServiceProtocol ) {
        self.router = router
        self.networkService = networkService
    }
    
    func transitionToCities(cities: [String]) {
        router.showCities(cities: cities)
    }
    
    func getCities(complition: @escaping ([Country]) -> ())  {
        networkService.getCity { result in
            switch result {
            case .success(let country):
                complition(country)
            case .failure(let error):
                print(error)
            }
        }
    }
}
