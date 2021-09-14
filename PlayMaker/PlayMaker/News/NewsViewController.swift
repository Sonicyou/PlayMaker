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
        bind()
    }
    
    private func configure() {
        newsView.newsTableView.dataSource = dataSource
        newsView.newsTableView.delegate = self
    }
    
    private func bind() {
        newsModel?.getNews(completion: { [weak self] news in
            self?.dataSource.newsList = news
            DispatchQueue.main.async {
                self?.newsView.newsTableView.reloadData()
                self?.newsView.stopActivityIndicator()
            }
        })
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsModel?.openNewsDescriptionVC(news: dataSource.newsList[indexPath.row])
    }
}
