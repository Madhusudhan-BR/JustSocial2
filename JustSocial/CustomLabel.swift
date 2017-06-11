//
//  CustomLabel.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/11/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        layer.shadowColor  = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1, height: 1)
        
       
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
        
        // Rounded Corners
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        
    }
    
    
}
