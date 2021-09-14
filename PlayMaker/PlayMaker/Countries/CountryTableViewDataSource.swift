//
//  CountryTableViewDataSource.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.08.2021.
//

import UIKit

class CountryTableViewDataSource: NSObject {
    var countries = [Country]()
}

extension CountryTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].country
        return cell
    }
}
