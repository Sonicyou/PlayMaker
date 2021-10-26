//
//  NewsTableViewCell.swift
//  PlayMaker
//
//  Created by Артем Фролов on 21.06.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    private let authorLabel = UILabel()
    private let title = UILabel()
    private let descriptionLabel = UILabel()
    private let sourceLabel = UILabel()
    private let publishedTimeLabel = UILabel()
    private let separatorView = UIView()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(news: News) {
        title.text = news.title
        authorLabel.text = news.author
        descriptionLabel.text = news.description
        sourceLabel.text = news.source
        publishedTimeLabel.text = news.publishedAt?.monthDayYear
    }
    
    private func configureUI() {
        [authorLabel, title, descriptionLabel, sourceLabel, publishedTimeLabel,  separatorView]
            .forEach { contentView.addSubview($0) }
        title.numberOfLines = 2
        title.font =  UIFont.boldSystemFont(ofSize: 18)
        sourceLabel.font = sourceLabel.font.withSize(14)
        publishedTimeLabel.font = publishedTimeLabel.font.withSize(14)
        descriptionLabel.numberOfLines = 3
        selectionStyle = .none
        separatorView.backgroundColor = .lightGray
    }
    
    private func configureLayout() {
        sourceLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(15)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(sourceLabel.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        publishedTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.equalTo(250)
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalTo(-15)
            make.leading.equalTo(15)
            make.height.equalTo(1)
            
        }
        
    }
    
}
