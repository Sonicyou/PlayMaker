//
//  NewsDescriptionView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.06.2021.
//

import UIKit

class NewsDescriptionView: UIView {
    
    private let stackView = UIStackView()
    private let image = UIImageView()
    private let title = UILabel()
    private let descriptionTextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(news: News) {
        title.text = news.title
        descriptionTextView.text = news.description
        image.isHidden = true
    }
    
    private func configureUI() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        addSubview(stackView)
        [title, descriptionTextView].forEach {
            stackView.addArrangedSubview($0)
        }
        title.numberOfLines = .zero
        title.textAlignment = .center
        backgroundColor = .white
    }
    
    private func configureLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}
