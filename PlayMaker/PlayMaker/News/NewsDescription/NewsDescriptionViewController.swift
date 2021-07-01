//
//  NewsDescriptionViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.06.2021.
//

import UIKit

class NewsDescriptionViewController: UIViewController {

    let newsDescriptionModel: NewsDescriptionModel
    private let newsView = NewsDescriptionView()
    
    init(newsDescriptionModel: NewsDescriptionModel) {
        self.newsDescriptionModel = newsDescriptionModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    private func configureUI() {
        view.addSubview(newsView)
        newsView.setup(news: newsDescriptionModel.news)
    }
    
    private func configureLayout() {
        newsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
