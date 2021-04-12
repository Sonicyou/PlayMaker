//
//  MainTableViewCell.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.04.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
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
    
    func setup() {
        profileImageView.image = #imageLiteral(resourceName: "profile")
        profileNameLabel.text = "sonicyou"
    }
    
    private func configureUI() {
        [profileImageView, profileNameLabel].forEach { addSubview($0) }
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
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
}
