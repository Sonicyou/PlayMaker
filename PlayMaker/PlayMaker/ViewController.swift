//
//  ViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 18.03.2021.
//

import UIKit

class ViewController: UITabBarController {
    
    private var newsNavigationController: UINavigationController?
    private var weatherNavigationController: UINavigationController?
    private var mapNavigationController: UINavigationController?
    private var profileNavigationController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBarControllers()
    }
    
    private func makeNewsNavigationController() -> UINavigationController? {
        let newsVC = NewsAssembly().build()
        newsNavigationController = UINavigationController(rootViewController: newsVC)
        let newsItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        newsNavigationController?.tabBarItem = newsItem
        newsNavigationController?.navigationBar.prefersLargeTitles = true
        newsNavigationController?.navigationBar.topItem?.title = "Новости"
        return newsNavigationController
    }
    
    private func makeProfileNavigationController() -> UINavigationController? {
        let profileVC = ProfileAssembly().build()
        profileNavigationController = UINavigationController(rootViewController: profileVC)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        profileNavigationController?.tabBarItem = profileItem
        profileNavigationController?.navigationBar.prefersLargeTitles = true
        profileNavigationController?.navigationBar.topItem?.title = "Профиль"
        return profileNavigationController
    }
    
    private func makeTabBarControllers() {
        var array = [UIViewController]()
        if let newsNavigationController = makeNewsNavigationController() {
           array.append(newsNavigationController)
        }
        
        array.append(contentsOf: [WeatherAssembly().build(),MapAssembly().build()])
        
        if let profileNavigationController = makeProfileNavigationController() {
            array.append(profileNavigationController)
        }
        
        viewControllers = array
    }
}

