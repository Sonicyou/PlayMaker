//
//  ViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 18.03.2021.
//

import UIKit

class ViewController: UITabBarController {
    
    private var newsNavigationController : UINavigationController!
    private var weatherNavigationController : UINavigationController!
    private var mapNavigationController : UINavigationController!
    private var profileNavigationController : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBarControllers()
        
    }
    
    private func makeTabBarControllers() {
        let profileVC = ProfileAssembly().build()
        profileNavigationController = UINavigationController(rootViewController: profileVC)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        profileNavigationController.tabBarItem = profileItem
        profileNavigationController?.navigationBar.prefersLargeTitles = true
        profileNavigationController?.navigationBar.topItem?.title = "Профиль"
        
        viewControllers = [NewsAssembly().build(),WeatherAssembly().build(), MapAssembly().build(), profileNavigationController]
        
    }
}

