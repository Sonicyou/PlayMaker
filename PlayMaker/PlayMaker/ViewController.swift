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
        newsNavigationController?.navigationBar.topItem?.title = "News"
        return newsNavigationController
    }
    
    private func makeProfileNavigationController() -> UINavigationController? {
        let profileVC = ProfileAssembly().build()
        profileNavigationController = UINavigationController(rootViewController: profileVC)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
        profileNavigationController?.tabBarItem = profileItem
        profileNavigationController?.navigationBar.prefersLargeTitles = true
        profileNavigationController?.navigationBar.topItem?.title = "Profile"
        return profileNavigationController
    }
    
    private func makeWeatherNavigationController() -> UINavigationController? {
        let weatherVC = WeatherAssembly().build()
        weatherNavigationController = UINavigationController(rootViewController: weatherVC)
        let weatherItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun"), selectedImage: nil)
        weatherNavigationController?.tabBarItem = weatherItem
        weatherNavigationController?.navigationBar.prefersLargeTitles = true
        weatherNavigationController?.navigationBar.topItem?.title = "Weather"
        return weatherNavigationController
    }
    
    private func makeTabBarControllers() {
        var array = [UIViewController]()
        if let newsNavigationController = makeNewsNavigationController() {
           array.append(newsNavigationController)
        }
        
        if let weatherNavigationController = makeWeatherNavigationController() {
           array.append(weatherNavigationController)
        }
        
        array.append(MapAssembly().build())
        
        if let profileNavigationController = makeProfileNavigationController() {
            array.append(profileNavigationController)
        }
        
        viewControllers = array
    }
}

