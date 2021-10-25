//
//  MainTableViewCell.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.04.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var callback: VoidCompletion?
    private let profileImageView = UIImageView()
    private let profileNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout()
        
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage?) {
        let defaultImageConfiguration = UIImage.SymbolConfiguration(pointSize: 16, weight: .ultraLight)
        let defaultImage = UIImage(systemName: "plus.circle", withConfiguration: defaultImageConfiguration)?.withTintColor(.lightGray)
        profileImageView.image = image ?? defaultImage
        profileNameLabel.text = "sonicyou"
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        profileImageView.addGestureRecognizer(tap)
        profileImageView.isUserInteractionEnabled = true
    }
    
    private func configureUI() {
        [profileImageView, profileNameLabel].forEach { contentView.addSubview($0) }
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        profileImageView.isUserInteractionEnabled = true
        profileNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        profileNameLabel.textAlignment = .center
        profileNameLabel.numberOfLines = .zero
        selectionStyle = .none
    }
    
    private func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(10)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(15)
            make.bottom.equalTo(-10)
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        callback?() 
    }
}
