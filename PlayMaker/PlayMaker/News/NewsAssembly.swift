//
//  NewsAssembly.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsAssembly {
    
    func build() -> UIViewController {
        let newsStoryboard = UIStoryboard(name: "News", bundle: nil)
        let newsVC = newsStoryboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        let router = NewsRouter()
        let viewModel = NewsModel(newsRouter: router)
        newsVC.newsModel = viewModel
        let _ = UINavigationController(rootViewController: newsVC)
        let newsItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        newsVC.tabBarItem = newsItem
        return newsVC
    }
}
