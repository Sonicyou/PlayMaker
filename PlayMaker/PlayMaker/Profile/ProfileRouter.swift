//
//  ProfileRouter.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import Foundation

class ProfileRouter {
    
    func transitionToControllers(type: Field.FieldState) {
        switch type {
        case .city:
            print("city")
        case .profile:
            print("profile")
        case .temperature:
            print("temperature")
        case .birthdate:
            print("birthdate")
        case .notification:
            print("notification")
        }
    }
}
