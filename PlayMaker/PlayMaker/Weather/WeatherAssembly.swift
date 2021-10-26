//
//  WeatherAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class WeatherAssembly: BaseAssembly {
    
    func build() -> UIViewController {
        let weatherStoryboard = UIStoryboard(name: "Weather", bundle: nil)
        let weatherVC = weatherStoryboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let router = WeatherRouter()
        let viewModel = WeatherModel(weatherRouter: router, networkService: serviceFactory.network)
        weatherVC.weatherModel = viewModel
        let _ = UINavigationController(rootViewController: weatherVC)
        return weatherVC
        
    }
}
