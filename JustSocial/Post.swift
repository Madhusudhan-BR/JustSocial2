//
//  Post.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/12/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import Foundation


class Post{
    private var _caption: String!
    private var _likes: Int!
    private var _imageURL: String!
    private var _postID: String!
    
    var caption: String {
        return _caption
    }
    
    var likes: Int {
        return _likes
    }
    
    var imageURL: String {
        return _imageURL
    }
    
    var postID: String {
        return _postID
    }
    
    init(caption: String, likes: Int, imageURL: String) {
        
        self._imageURL = imageURL
        self._likes = likes
        self._caption = caption
    }
    
    init(postID: String, postData : Dictionary<String, AnyObject>) {
        
        if let caption = postData["Caption"] as? String {
            self._caption = caption
        }
      
        if let imageUrl = postData["ImageUrl"] as? String {
            self._imageURL = imageUrl
        }
        
        if let likes = postData["Likes"] as? Int {
            self._likes = likes
        }
        
        
    }
    
}
