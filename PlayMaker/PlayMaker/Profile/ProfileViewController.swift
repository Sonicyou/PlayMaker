//
//  ProfileViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private var profileView: ProfileView!
    
    var profileModel: ProfileModel!
    private lazy var dataSource = ProfileDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        view.backgroundColor = .white
    }
    
    private func configure() {
        profileView.profileTableView.dataSource = dataSource
        profileView.profileTableView.delegate = self
    }
    
    private func bind() {
        let fields = profileModel.getProfileFields()
        dataSource.fields = fields
        profileView.profileTableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard indexPath.section != .zero else { return }
        if indexPath.section == 0 {
            profileModel.openMedia()
        }
        profileModel.transitionToControllers(type: dataSource.fields[indexPath.row].type)
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
}
