//
//  NewsDescriptionView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.06.2021.
//

import UIKit
import SDWebImage

class NewsDescriptionView: UIView {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
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
        if let string = news.image {
            imageView.sd_setImage(with: URL(string: string)) { image, _, _, _ in
                if let _ = image {
                    delay(1) {
                        self.stackView.insertArrangedSubview(self.imageView, at: 0)
                    }
                }
            }
        }
        
        if let newsTitle = news.title {
            self.title.text = newsTitle
            self.stackView.addArrangedSubview(self.title)
        }
        
        if let descriptionText = news.description {
            self.descriptionTextView.text = descriptionText
            self.stackView.addArrangedSubview(self.descriptionTextView)
        }
    }
    
    private func configureUI() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        addSubview(stackView)
        imageView.contentMode = .scaleAspectFill
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
    
    deinit {
        print("NewsDescriptionView")
    }
}

func delay(_ delay: TimeInterval, closure: @escaping VoidCompletion) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
