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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

}
