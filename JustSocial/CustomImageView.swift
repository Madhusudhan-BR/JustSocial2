//
//  CustomImageView.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/12/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {

    override func awakeFromNib() {
         super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 35
    }
    
}
