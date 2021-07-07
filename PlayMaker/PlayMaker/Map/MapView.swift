//
//  MapView.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit
import MapKit

class MapView: UIView {
    
    var mapView: MKMapView?
    var completionLocationTapped: VoidCompletion?
    private let zoomInButton = UIButton()
    private let zoomOutButton = UIButton()
    private let myLocationButton = UIButton()

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        configureLayout()
    }
     
    private func configureUI() {
        mapView = MKMapView(frame: frame)
        if let mapView = mapView {
            addSubview(mapView)
        }
        
        [zoomInButton, zoomOutButton, myLocationButton].forEach {
            addSubview($0)
            $0.backgroundColor = .white
            $0.setupShadow(opacity: 0.5, offset: .zero, radius: 10, color: UIColor.black.cgColor)
            $0.layer.cornerRadius = 20
            $0.tintColor = .black
        }
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        zoomInButton.addTarget(self, action:  #selector(zoomInTapped), for: .touchUpInside)
        zoomOutButton.addTarget(self, action: #selector(zoomOutTapped), for: .touchUpInside)
        myLocationButton.addTarget(self, action: #selector(myLocationTapped), for: .touchUpInside)

        zoomInButton.setImage(UIImage(systemName: "plus", withConfiguration: boldConfig), for: .normal)
        zoomOutButton.setImage(UIImage(systemName: "minus", withConfiguration: boldConfig), for: .normal)
        myLocationButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
       
    }
    
    private func configureLayout() {
        zoomInButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.trailing.equalTo(-30)
            make.bottom.equalTo(zoomOutButton.snp.top).offset(-20)
        }

        zoomOutButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.trailing.equalTo(-30)
            make.bottom.equalTo(myLocationButton.snp.top).offset(-50)
        }
        
        myLocationButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.trailing.equalTo(-30)
            make.bottom.equalTo(-120)
        }
    }

    @objc private func zoomInTapped() {
        guard var region = mapView?.region else { return }
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView?.setRegion(region, animated: true)
    }
    
    @objc private func zoomOutTapped() {
        guard var region = mapView?.region else { return }
        region.span.latitudeDelta  = min(region.span.latitudeDelta  * 2.0, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta * 2.0, 180.0)
        mapView?.setRegion(region, animated: true)
    }
    
    @objc private func myLocationTapped() {
        completionLocationTapped?()
    }
}
