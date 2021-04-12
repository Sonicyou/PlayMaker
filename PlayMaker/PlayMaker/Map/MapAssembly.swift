//
//  MapAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class MapAssembly {
    func build() -> UIViewController {
        let mapStoryboard = UIStoryboard(name: "Map", bundle: nil)
        let mapVC = mapStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let router = MapRouter()
        let viewModel = MapModel(mapRouter: router)
        mapVC.mapModel = viewModel
        let mapItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), selectedImage: nil)
        mapVC.tabBarItem = mapItem
        return mapVC
    }
}
