//
//  DataService.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/12/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let Ds = DataService()
    private let _BASE_REF = DB_BASE
    private var _BASE_POSTS = DB_BASE.child("Posts")
    private var _BASE_USERS = DB_BASE.child("Users")
    
    var BASE_REF: DatabaseReference {
        return _BASE_REF
    }
    
    var BASE_POSTS: DatabaseReference {
        return _BASE_POSTS
    }
    var BASE_USERS: DatabaseReference {
        return _BASE_USERS
    }
    
    func createDBUser(userID: String, userData: Dictionary<String,String>) {
        BASE_USERS.child(userID).updateChildValues(userData)
    }
    
}
