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
    private let userDefaults: UserDefaultsServiceProtocol
    
    init(
        router: CityRouter,
        cities: [String],
        networkService: NetworkServiceProtocol,
        userDefaults: UserDefaultsServiceProtocol
    ) {
        self.cities = cities
        self.router = router
        self.networkService = networkService
        self.userDefaults = userDefaults
    }
    
    func returnToProfileScreen() {
        router.returnToProfileScreen()
    }
    
    func setValue<T>(key: DefaultsKey<T>, value: T?) {
        userDefaults.set(key: key, value: value)
    }
}
