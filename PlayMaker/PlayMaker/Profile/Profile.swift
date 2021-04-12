//
//  Profile.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.04.2021.
//

import Foundation

struct Profile: Codable {
    let fields: [Field]
}

struct Field: Codable {
    let type: FieldState
    let image: String
    let title: String
    let subtitle: String?
    let switchField: Bool?
    let picker: Bool?
    let datePicker: Bool?
    let nextImage: String?
    
    enum FieldState: String, Codable {
        case city, profile, temperature, birthdate, notification
    }
}

