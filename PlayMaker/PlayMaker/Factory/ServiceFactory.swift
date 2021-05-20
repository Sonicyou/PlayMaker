//
//  ServiceFactory.swift
//  PlayMaker
//
//  Created by Артем Фролов on 17.05.2021.
//

import Foundation

protocol ServiceFactoryProtocol {
    var defaults: UserDefaultsServiceProtocol { get }
    var network: NetworkServiceProtocol { get }
}

class ServiceFactory: ServiceFactoryProtocol {
    static var shared = ServiceFactory()
    
    var defaults: UserDefaultsServiceProtocol
    var network: NetworkServiceProtocol
   
    init() {
        defaults = UserDefaultsService(defaults: UserDefaults.standard)
        network = NetworkService()
    }
}
