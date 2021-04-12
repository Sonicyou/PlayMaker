//
//  ProfileView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit
import SnapKit

class ProfileView: UIView {

    let profileTableView = UITableView.init(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        configureLayout()
    }
    
    private func configureUI() {
        addSubview(profileTableView)
        profileTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        profileTableView.register(FieldTableViewCell.self, forCellReuseIdentifier: "FieldTableViewCell")
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 44.0
        profileTableView.separatorStyle = .none
    }
    
    private func configureLayout() {
        profileTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
