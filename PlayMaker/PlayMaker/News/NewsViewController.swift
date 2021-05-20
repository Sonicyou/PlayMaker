//
//  NewsViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet private var newsView: NewsView!
    
    var newsModel: NewsModel?
    private lazy var dataSource = NewsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        newsModel?.moduleDidLoad()
    }
    
    private func configure() {
        newsView.newsTableView.dataSource = dataSource
        newsView.newsTableView.delegate = self
    }
    
    private func bind() {
        
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsModel?.openNewsDescriptionVC()
    }
}
