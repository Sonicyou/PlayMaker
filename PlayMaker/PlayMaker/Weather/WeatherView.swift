//
//  WeatherView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherIcon = UIImageView()
    private let city_name = UILabel()
    private let sunset = UILabel()
    private let sunrise = UILabel()
    private let temp = UILabel()
    private let descriptionWeather = UILabel()


    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        configureLayout()
    }
    
    private func configureUI() {
      
    }
    
    private func configureLayout() {
        
    }
}
