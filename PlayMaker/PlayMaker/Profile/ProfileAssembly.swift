//
//  ProfileAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class ProfileAssembly {
    
    func build() -> UIViewController {
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let router = ProfileRouter()
        let viewModel = ProfileModel(profileRouter: router)
        profileVC.profileModel = viewModel
        let _ = UINavigationController(rootViewController: profileVC)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        profileVC.tabBarItem = profileItem
        return profileVC
    }
}
