//
//  CitiesViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import UIKit

class CountryViewController: UIViewController {

    let countryModel: CountryModel
    private let citiesView = CountryView()
    private lazy var dataSource = CountryTableViewDataSource()
    
    init(model: CountryModel) {
        countryModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
        bind() 
    }
    
    private func configureUI() {
        view.addSubview(citiesView)
        citiesView.countriesTableView.dataSource = dataSource
        citiesView.countriesTableView.delegate = self
        self.navigationItem.title = "Country"
    }
    
    private func configureLayout() {
        citiesView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func bind() {
        countryModel.getCities(complition: { [weak self] countries in
            self?.dataSource.countries = countries
            DispatchQueue.main.async {
                self?.citiesView.countriesTableView.reloadData()
            }
        })
    }
}

extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryModel.transitionToCities(cities: dataSource.countries[indexPath.row].cities)
    }
}
