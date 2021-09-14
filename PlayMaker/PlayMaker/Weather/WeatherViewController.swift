//
//  WeatherViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private var weatherView: WeatherView!
    
    var weatherModel: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        weatherModel?.getWeather(complition: { [weak self] weather in
            DispatchQueue.main.async {
                self?.weatherView.setup(weather: weather)
            }
        })
    }
}
