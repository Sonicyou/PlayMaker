//
//  CitiesView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import UIKit

class CountryView: UIView {
    
    let countriesTableView = UITableView.init(frame: .zero)
    
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
        addSubview(countriesTableView)
        countriesTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        countriesTableView.estimatedRowHeight = 40.0
    }
    
    private func configureLayout() {
        countriesTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
