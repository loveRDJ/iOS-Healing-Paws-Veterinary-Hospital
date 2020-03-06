//
//  DoctorsViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/4.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class DoctorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var doctors = ["V1","V2","V3"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Veterinarians"
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        doctors.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 135
       }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorCell") as! DoctorTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 3
        cell.photo.image = UIImage(named: "doctor")
        cell.photo.layer.cornerRadius = (cell.photo.frame.height) / 1.5
        cell.label.text = doctors[indexPath.row]
        cell.introduction.text = doctors[indexPath.row]
        
        return cell
    }

}
