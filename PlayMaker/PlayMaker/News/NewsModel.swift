//
//  NewsModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import Foundation

class NewsModel {
    
    private let newsRouter: NewsRouter
    private let networkService: NetworkServiceProtocol
    
    init(newsRouter: NewsRouter, networkService: NetworkServiceProtocol) {
        self.newsRouter = newsRouter
        self.networkService = networkService
    }
    
    func openNewsDescriptionVC(news: News) {
        newsRouter.openNewsDescriptionVC(news: news)
        
    }
    
    func getNews(completion: @escaping ([News]) -> ()) {
        networkService.getNews { [weak self] result in
            switch result {
            case .success(let news):
                completion(news)
            case .failure(let error):
                self?.newsRouter.showError(error)
            }
        }
    }
}
