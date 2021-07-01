//
//  NewsRouter.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsRouter {
    
    weak var viewController: UIViewController?
    
    func openNewsDescriptionVC(news: News) {
        let vc = NewsDescriptionAssembly().build(news: news)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError(_ error: Error) {
        print(error.localizedDescription)
    }
}
