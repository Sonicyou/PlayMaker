//
//  NewsDataSource.swift
//  PlayMaker
//
//  Created by Артем Фролов on 21.06.2021.
//

import UIKit

class NewsDataSource: NSObject {
    var newsList = [News]()
}

extension NewsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.setup(news: newsList[indexPath.row])
        return cell
    }
}

