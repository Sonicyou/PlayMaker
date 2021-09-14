//
//  CityTableViewDataSource.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import UIKit

class CityTableViewDataSource: NSObject {
    var cities = [String]()
}

extension CityTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
}

