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
        viewControllers = [NewsAssembly().build(),WeatherAssembly().build(), MapAssembly().build(), ProfileAssembly().build()]
    }
}

