//
//  ProfileRouter.swift
//  PlayMaker
//
//  Created by Артем Фролов on 04.04.2021.
//

import UIKit

class ProfileRouter {
    
    weak var profileViewController: ProfileViewController?
    
    func transitionToControllers(type: Field.FieldState) {
        switch type {
        case .city:
            let citiesVC = CitiesAssembly().build()
            profileViewController?.navigationController?.pushViewController(citiesVC, animated: true)
        case .profile:
            print("profile")
        default:
            break
        }
    }
    
    func createAlertController() {
        let alert = UIAlertController(title: "Choose image:", message: nil, preferredStyle: .actionSheet)
        let galleryButton = UIAlertAction(title: "Gallery", style: .default) { [weak self] _ in
            self?.openGallery()
        }
        let cameraButton = UIAlertAction(title: "Camera", style: .default) { [weak self]  _ in
            self?.openCamera()
        }
        alert.addAction(galleryButton)
        alert.addAction(cameraButton)
        profileViewController?.present(alert, animated: true)
    }
    
    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = profileViewController
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            profileViewController?.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func openCamera() {
        print("openCamera")
    }
}
