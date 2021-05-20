//
//  ProfileDataSource.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.04.2021.
//

import UIKit

class ProfileDataSource: NSObject {
    
    var fields = [Field]()
    var completionDataSource: VoidCompletion?
    var userImage: UIImage?
    
    enum ProfileTableSection: Int, CaseIterable {
        case main, field
    }
}

extension ProfileDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        ProfileTableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileTableSection(rawValue: section) else { return .zero }
        switch section {
        case .main:
            return 1
        case .field:
            return fields.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ProfileTableSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .main:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell {
                cell.setup(image: userImage)
                cell.callback = { [weak self] in
                    self?.completionDataSource?()
                }
                return cell
            }
        case .field:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FieldTableViewCell", for: indexPath) as? FieldTableViewCell {
                cell.setup(fields[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
}
