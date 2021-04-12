//
//  ServiceFactory.swift
//  PlayMaker
//
//  Created by Артем Фролов on 17.05.2021.
//

import Foundation

protocol ServiceFactoryProtocol {
    var defaults: UserDefaultsServiceProtocol { get }
}

class ServiceFactory: ServiceFactoryProtocol {
    static var shared = ServiceFactory()
    
    var defaults: UserDefaultsServiceProtocol
    init() {
        defaults = UserDefaultsService(defaults: UserDefaults.standard)
    }
}
