//
//  NetworkService.swift
//  PlayMaker
//
//  Created by Артем Фролов on 20.05.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getNews()
    func getWeather()
}

class NetworkService: NetworkServiceProtocol {
    
    let baseNewsURL = "http://api.mediastack.com/v1/news"
    let accessKey = "780806bad258a48c2086c56339c09461"
    
    func getNews() {
        let URLString = baseNewsURL + "?access_key=" + accessKey
        getRequest(URLString: URLString) { data, error in
            if let data = data {
//                let news = try! JSONDecoder().decode(NewsResponse.self, from: data)
//                print(String(data: data, encoding: .utf8)!)
//                print (news)
            }
            if let error = error {
                print(error)
            }
        }
    }
    
    func getWeather() {
        print("weather")//TODO: change
    }
    
    private func getRequest(URLString: String, completion: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: URLString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }
        
        task.resume()
        
    }
}
