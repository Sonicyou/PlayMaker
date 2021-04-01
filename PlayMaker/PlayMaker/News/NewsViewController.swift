//
//  NewsViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet private var newsView: NewsView!
    
    var newsModel: NewsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
