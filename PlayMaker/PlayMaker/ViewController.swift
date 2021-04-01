//
//  ViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 18.03.2021.
//

import UIKit

class ViewController: UITabBarController {
    
    private var newsNavigationController : UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBarControllers()
       
    }
    
    private func makeTabBarControllers() {
        viewControllers = [NewsAssembly().build()]
    }
    

}

