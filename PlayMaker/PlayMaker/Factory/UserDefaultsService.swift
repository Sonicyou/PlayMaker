//
//  UserDefaultsService.swift
//  PlayMaker
//
//  Created by Артем Фролов on 17.05.2021.
//

import Foundation

protocol UserDefaultsServiceProtocol: AnyObject {
   
    func get<T>(key: DefaultsKey<T>) -> T?
    func set<T>(key: DefaultsKey<T>, value: T?)
}

class UserDefaultsService: UserDefaultsServiceProtocol {
   
    private var defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    func get<T>(key: DefaultsKey<T>) -> T? {
        defaults.object(forKey: key.value) as? T
    }
    
    func set<T>(key: DefaultsKey<T>, value: T?) {
        defaults.set(value, forKey: key.value)
    }
}

class DefaultsKeys {
    static let profileImage = DefaultsKey<Data>(value: "profileImage")
    static let tempFormat = DefaultsKey<String>(value: "tempFormat")
    static let isOnNotification = DefaultsKey<Bool>(value: "isOnNotification")
    static let city = DefaultsKey<String>(value: "city")
}

class DefaultsKey<T>: DefaultsKeys {
    
    let value: String
    
    init(value: String) {
        self.value = value
    }
}
