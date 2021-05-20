//
//  NewsAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsAssembly: BaseAssembly {
    
    func build() -> UIViewController {
        let newsStoryboard = UIStoryboard(name: "News", bundle: nil)
        let newsVC = newsStoryboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        let router = NewsRouter()
        router.viewController = newsVC
        let viewModel = NewsModel(newsRouter: router, networkService: serviceFactory.network)
        newsVC.newsModel = viewModel
        let _ = UINavigationController(rootViewController: newsVC)
        return newsVC
    }
}
