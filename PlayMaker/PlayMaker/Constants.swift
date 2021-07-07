//
//  Constants.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.05.2021.
//

import Foundation

typealias VoidCompletion = (() -> Void)
typealias NewsCompletion = (Result<[News], Error>) -> ()
typealias ResultCompletion = (Result<Data, Error>) -> ()
typealias WeatherCompletion = (Result<[Weather], Error>) -> ()


let baseNewsURL = "http://api.mediastack.com/v1/news?access_key="
let baseWeatherURL = "http://api.weatherbit.io/v2.0/current?city=Moscow"
let accessKey = "780806bad258a48c2086c56339c09461"
let weatherKey = "&key=6b88334047f5486e8cd81bcf0e398443"
