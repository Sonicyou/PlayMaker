//
//  NewsView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 01.04.2021.
//

import UIKit

class NewsView: UIView {
    
    let newsTableView = UITableView.init(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()   
        configureLayout()
    }
    
    private func configureUI() {
        addSubview(newsTableView)
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        newsTableView.estimatedRowHeight = 80.0
    }
    
    private func configureLayout() {
        newsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

