//
//  AppointmentViewController.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/3.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return element.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.name = element[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let important = importantAction(at: indexPath)
//        return UISwipeActionsConfiguration(actions: [important])
//    }
//    
//    func importantAction(at indexPath: IndexPath) -> UIContextualAction {
//        <#function body#>
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 5
        cell.appointmentTime.text = element[indexPath.row]
        cell.photo.image = UIImage(named: "home")
        cell.photo.layer.cornerRadius = cell.photo.frame.height / 2
        
        return cell
    }
    
    
    
    let element = ["1","2","3"]
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
