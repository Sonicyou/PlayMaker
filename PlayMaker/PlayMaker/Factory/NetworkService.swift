//
//  NetworkService.swift
//  PlayMaker
//
//  Created by Артем Фролов on 20.05.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews(completion: @escaping NewsCompletion)
    func getWeather(completion: @escaping WeatherCompletion)
    func getCity(completion: @escaping CitiesCompletion)
}

class NetworkService: NetworkServiceProtocol {
    
    func getNews(completion: @escaping NewsCompletion) {
        getRequest(URLString: baseNewsURL + accessKey) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(jsonData.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getWeather(completion: @escaping WeatherCompletion) {
        getRequest(URLString: baseWeatherURL + weatherKey) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    completion(.success(jsonData.data.first))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getCity(completion: @escaping CitiesCompletion) {
        getRequest(URLString: baseCitiesURL) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(CityResponse.self, from: data)
                    completion(.success(jsonData.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

extension NetworkService {
    private func getRequest(URLString: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: URLString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
