//
//  NewsDescriptionAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.06.2021.
//

import Foundation

class NewsDescriptionAssembly {
    
    func build(news: News) -> NewsDescriptionViewController {
        let router = NewsDescriptionRouter()
        let model = NewsDescriptionModel(router: router, news: news)
        let vc = NewsDescriptionViewController(newsDescriptionModel: model)
        return vc
    }
}
