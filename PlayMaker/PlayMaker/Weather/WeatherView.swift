//
//  WeatherView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherIcon = UIImageView()
    private let cityName = UILabel()
    private let sunset = UILabel()
    private let sunrise = UILabel()
    private let temp = UILabel()
    private let descriptionWeather = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        configureLayout()
    }
    
    func setup(weather: Weather?) {
        guard let weather = weather else { return }
        cityName.text = weather.city_name
        temp.text = String(weather.temp)
        descriptionWeather.text = weather.weather?.description
        sunrise.text = "Рассвет: " + weather.sunrise
        sunset.text = "Закат: " + weather.sunset
    }
    
    private func configureUI() {
        [weatherIcon,cityName,sunset,sunrise,temp,descriptionWeather].forEach {
            addSubview($0)
        }
        cityName.font = cityName.font.withSize(50)
        temp.font = temp.font.withSize(80)
        descriptionWeather.font = descriptionWeather.font.withSize(30)
        sunrise.font = sunrise.font.withSize(30)
        sunset.font = sunset.font.withSize(30)
    }
    
    private func configureLayout() {
        cityName.snp.makeConstraints { make in
            make.top.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        temp.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        descriptionWeather.snp.makeConstraints { make in
            make.top.equalTo(temp.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        sunrise.snp.makeConstraints { make in
            make.bottom.equalTo(sunset.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        sunset.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
        }
    }
}
