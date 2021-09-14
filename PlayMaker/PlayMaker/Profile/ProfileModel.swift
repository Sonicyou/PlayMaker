//
//  ProfileModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class ProfileModel {
    
    private let profileRouter: ProfileRouter
    private let userDefaults: UserDefaultsServiceProtocol
    
    init(profileRouter: ProfileRouter, userDefaults: UserDefaultsServiceProtocol) {
        self.profileRouter = profileRouter
        self.userDefaults = userDefaults
    }
    
    func transitionToControllers(type: Field.FieldState) {
        profileRouter.transitionToControllers(type: type)
    }
    
    func getProfileFields() -> [Field] {
        if let path = Bundle.main.path(forResource: "Profile", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
                let profile = try! JSONDecoder().decode(Profile.self, from: data)
                return profile.fields
            } catch {
                print("error")
            }
        }
        return []
    }
    
    func setValue<T>(key: DefaultsKey<T>, value: T?) {
        userDefaults.set(key: key, value: value)
    }
    
    func getValue<T>(key: DefaultsKey<T>) -> T? {
        userDefaults.get(key: key)
    }
    
    func openMedia() {
        profileRouter.createAlertController()
    }
}
