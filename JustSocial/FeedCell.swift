//
//  FeedCell.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/12/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit
import Firebase
class FeedCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var postedDescription: UITextView!
    @IBOutlet weak var postedPicture: UIImageView!
    
    func configureCell(post : Post, image:UIImage? = nil){
        self.likesLabel.text = "\(post.likes)"
        self.postedDescription.text = post.caption
        
        if image != nil {
            self.postedPicture.image = image
        }
        else {
            let ref = Storage.storage().reference(forURL: post.imageURL)
            ref.getData(maxSize: 1024*1024, completion: { (data, error) in
                if error != nil {
                    print("MADHU: Unable to download from firebase storage")
                }
                else {
                    print("MADHU: Image downloaded from firebase")
                    if let imageData = data {
                        if let image = UIImage(data: imageData) {
                            self.postedPicture.image = image
                            FeedVC.imageCache.setObject(image, forKey: post.imageURL as NSString)
                        }
                        
                    }
                }
            })
        }
        
    }


}
