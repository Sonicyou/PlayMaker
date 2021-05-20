//
//  ProfileAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class ProfileAssembly: BaseAssembly {
    
    func build() -> UIViewController {
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let router = ProfileRouter()
        router.profileViewController = profileVC
        let viewModel = ProfileModel(profileRouter: router, userDefaults: serviceFactory.defaults)
        profileVC.profileModel = viewModel
        return profileVC
    }
}
