//
//  NewsView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsView: UIView {
    
    let newsTableView = UITableView.init(frame: .zero)
    private let activityIndicator = UIActivityIndicatorView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()   
        configureLayout()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    private func configureUI() {
        addSubview(newsTableView)
        newsTableView.separatorStyle = .none
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.estimatedRowHeight = 80.0
        addSubview(activityIndicator)
        activityIndicator.color = .blue
        activityIndicator.style = .large
        activityIndicator.startAnimating()
    }
    
    private func configureLayout() {
        newsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

