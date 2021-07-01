//
//  NetworkService.swift
//  PlayMaker
//
//  Created by Артем Фролов on 20.05.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews(completion: @escaping NewsCompletion)
    func getWeather()
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
    
    func getWeather() {
        getRequest(URLString: "TODO") { result in
            //TODO:
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
