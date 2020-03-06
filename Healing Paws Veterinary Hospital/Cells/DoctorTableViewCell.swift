//
//  DoctorTableViewCell.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/4.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var introduction: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
