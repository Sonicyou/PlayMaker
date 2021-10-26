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
    private var imageView = UIImageView()
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
        title.font =  UIFont.boldSystemFont(ofSize: 22)
        descriptionLabel.font = descriptionLabel.font.withSize(18)
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

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }

        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }

        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0

        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}
