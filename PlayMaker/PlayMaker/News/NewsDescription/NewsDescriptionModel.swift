//
//  NewsDescriptionModel.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.06.2021.
//

import Foundation

class NewsDescriptionModel {
    
    let router: NewsDescriptionRouter
    let news: News
    
    init(router: NewsDescriptionRouter, news: News) {
        self.router = router
        self.news = news
    }
}
