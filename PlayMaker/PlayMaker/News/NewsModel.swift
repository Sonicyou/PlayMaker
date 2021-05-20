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
    
    func getNews() {
        networkService.getNews()
    }
}
