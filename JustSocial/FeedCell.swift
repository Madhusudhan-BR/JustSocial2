//
//  FeedCell.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/12/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var postedDescription: UITextView!
    @IBOutlet weak var postedPicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }


}
