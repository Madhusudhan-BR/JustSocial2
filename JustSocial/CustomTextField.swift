//
//  CustomTextField.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/11/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 1).cgColor
        layer.borderWidth = 1.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Rounded Corners
        layer.masksToBounds = true
        layer.cornerRadius = 5
        
        
    }
}
