//
//  SliderCell.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/4.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!{
        didSet{
            imageView.image = image
        }
    }
}
