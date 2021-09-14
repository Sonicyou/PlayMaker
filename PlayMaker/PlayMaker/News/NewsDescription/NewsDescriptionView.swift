//
//  NewsDescriptionView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.06.2021.
//

import UIKit
import SDWebImage

class NewsDescriptionView: UIView {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let title = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(news: News) {
        if let string = news.image {
            imageView.sd_setImage(with: URL(string: string)) { image, _, _, _ in
                if let _ = image {
                    self.stackView.insertArrangedSubview(self.imageView, at: 0)
                    self.stackView.setCustomSpacing(20, after: self.imageView)

                }
            }
        }
        
        if let newsTitle = news.title {
            self.title.text = newsTitle
            self.stackView.addArrangedSubview(self.title)
            self.stackView.setCustomSpacing(10, after: self.title)
        }
        
        if let descriptionText = news.description {
            self.descriptionLabel.text = descriptionText
            self.stackView.addArrangedSubview(self.descriptionLabel)
        }
    }
    
    private func configureUI() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        imageView.contentMode = .scaleAspectFit
        descriptionLabel.numberOfLines = .zero
        title.numberOfLines = .zero
        title.textAlignment = .center
        backgroundColor = .white
    }
    
    private func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(-15)
            make.top.leading.equalTo(15)
        }
    }
}
