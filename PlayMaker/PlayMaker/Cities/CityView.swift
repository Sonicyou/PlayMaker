//
//  CityView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import UIKit

class CityView: UIView {

    let cityTableView = UITableView.init(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(cityTableView)
        cityTableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        cityTableView.estimatedRowHeight = 40.0
    }
    
    private func configureLayout() {
        cityTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
