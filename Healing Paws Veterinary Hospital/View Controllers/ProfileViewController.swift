//
//  ProfileViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/3.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.layer.cornerRadius = photo.frame.height / 2
        // Do any additional setup after loading the view.
    }
    

}
