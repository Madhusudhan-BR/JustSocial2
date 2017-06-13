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
    
    var likesRef : DatabaseReference!
    var post:Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tap.numberOfTapsRequired = 1
        heartImage.addGestureRecognizer(tap)
        heartImage.isUserInteractionEnabled = true
        
    }
    
    func likeTapped(sender: UITapGestureRecognizer) {
        likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.heartImage.image = UIImage(named: "heart_selected_round")
                self.post.adjustLikes(addLikes: true)
                self.likesRef.setValue(true)
            }
            else {
                self.heartImage.image = UIImage(named: "heart_selected_icon")
                self.post.adjustLikes(addLikes: false)
                self.likesRef.removeValue()
                
            }
            
        })

    }
    
    func configureCell(post : Post, image:UIImage? = nil){
        likesRef =  DataService.Ds.CURRENT_USER_REF.child("Likes").child(post.postID)
        self.post = post
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
        
                likesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let _ = snapshot.value as? NSNull {
                self.heartImage.image = UIImage(named: "heart_selected_icon")
            }
            else {
                self.heartImage.image = UIImage(named: "heart_selected_round")
            }
            
        })
    }


}
