//
//  UploadButton.swift
//  Healing Paws Veterinary Hospital
//
//  Created by Jinyi Liu on 2020/3/5.
//  Copyright © 2020 Jinyi Liu. All rights reserved.
//

import UIKit

class UploadButton: UIButton{
    override init(frame: CGRect) {
              super.init(frame: frame)
              setupButton()
          }
          
          required init?(coder aDecoder: NSCoder) {
              super.init(coder: aDecoder)
              setupButton()
          }
          
          func setupButton(){
            setTitleColor(.white, for: .normal)
                     
            backgroundColor = .gray
            layer.cornerRadius = 10
          }
}
