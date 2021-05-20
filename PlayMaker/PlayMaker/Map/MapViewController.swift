//
//  MapViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet private var mapView: MapView!
    
    var mapModel: MapModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}
