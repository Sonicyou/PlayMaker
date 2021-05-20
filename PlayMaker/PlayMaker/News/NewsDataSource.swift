//
//  NewsDataSource.swift
//  PlayMaker
//
//  Created by Артем Фролов on 21.06.2021.
//

import UIKit

class NewsDataSource: NSObject {
    
}

extension NewsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.setup(text: "ячейка")
        return cell
    }
    
    
}

