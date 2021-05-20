//
//  ProfileViewController.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private var profileView: ProfileView!
    
    var profileModel: ProfileModel?
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
        let fields = profileModel?.getProfileFields()
        dataSource.fields = fields ?? []
        if let data = profileModel?.getValue(key: .profileImage) {
            dataSource.userImage = UIImage(data: data)
        }
        profileView.profileTableView.reloadData()
        dataSource.completionDataSource = { [weak self] in
            self?.profileModel?.openMedia()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section != .zero else { return }
        switch dataSource.fields[indexPath.row].type {
        case .city, .profile:
            profileModel?.transitionToControllers(type: dataSource.fields[indexPath.row].type)
        default:
            break
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            dataSource.userImage = pickedImage
            profileView.profileTableView.reloadData()
            let data = pickedImage.jpegData(compressionQuality: 0.5)
            profileModel?.setValue(key: .profileImage, value: data)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
