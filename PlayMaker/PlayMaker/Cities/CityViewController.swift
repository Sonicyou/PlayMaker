//
//  CityViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import UIKit

class CityViewController: UIViewController {
    
    var cityCompletion: StringCompletion?
    let cityModel: CityModel
    private let cityView = CityView()
    private lazy var dataSource = CityTableViewDataSource()
    
    init(model: CityModel) {
        cityModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    private func configureUI() {
        view.addSubview(cityView)
        dataSource.cities = cityModel.cities
        cityView.cityTableView.dataSource = dataSource
        cityView.cityTableView.delegate = self
    }
    
    private func configureLayout() {
        cityView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension CityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityCompletion?(dataSource.cities[indexPath.row])
        cityModel.setValue(key: .city, value: dataSource.cities[indexPath.row])
        cityModel.returnToProfileScreen()
    }
}
