//
//  ProfileModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import Foundation

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
    
    func setValue() {
        userDefaults.set(key: .tempFormat, value: "celcius")
    }
    
    func getValue() {
        let _ = userDefaults.get(key: .profileImage)
    }
    
}
