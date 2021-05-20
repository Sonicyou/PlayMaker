//
//  CitiesViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 03.06.2021.
//

import UIKit

class CitiesViewController: UIViewController {

    let citiesModel: CitiesModel
    
    init(model: CitiesModel) {
        citiesModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
