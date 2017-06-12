//
//  FeedVC.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/11/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        DataService.Ds.BASE_POSTS.observe(.value, with: { (snapshot) in
            print("MADHU : Snapshot received from firebase ")
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    print("SNAP RECEIVED : \(snap)")
                    if let postDict = snap.value as? Dictionary<String,AnyObject> {
                        let key = snap.key
                        let post = Post(postID: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedCell {
            cell.configureCell(post: post)
            return cell
        }
        else {
            return FeedCell()
        }
        
      //  print(post.caption)
       // return cell
    }
    

    @IBAction func logoutButtonTapped(_ sender: Any) {
        let keyChain = KeychainWrapper.standard.removeObject(forKey: "uid")
        try! Auth.auth().signOut()
        print("MADHU: sign out tapped")
        dismiss(animated: true, completion: nil)
    }
   
}
