//
//  NewsRouter.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsRouter {
    
    weak var viewController: UIViewController?
    
    func openNewsDescriptionVC() {
        
        let vc = NewsDescriptionAssembly().build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
