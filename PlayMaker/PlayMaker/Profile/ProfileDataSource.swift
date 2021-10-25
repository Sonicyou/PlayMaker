//
//  ProfileDataSource.swift
//  PlayMaker
//
//  Created by Артем Фролов on 12.04.2021.
//

import UIKit

protocol ProfileDataSourceProtocol: AnyObject {
    func notificationChanged(value: Bool)
}

class ProfileDataSource: NSObject {
    
    weak var delegate: ProfileDataSourceProtocol?
    var fields = [Field]()
    var completionDataSource: VoidCompletion?
    var userImage: UIImage?
    var isOn: Bool?
    var cityName: String?
    
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
                cell.setup(fields[indexPath.row], isOn, cityName: cityName)
                cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension ProfileDataSource: FieldTableViewCellProtocol {
    func notificationChanged(value: Bool) {
        delegate?.notificationChanged(value: value)
    }
}


