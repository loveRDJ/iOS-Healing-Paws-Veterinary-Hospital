//
//  DetailViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/3.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
     var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = name
        // Do any additional setup after loading the view.
    }

}
