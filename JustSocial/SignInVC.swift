//
//  SignInVC.swift
//  JustSocial
//
//  Created by Madhusudhan B.R on 6/10/17.
//  Copyright © 2017 Madhusudhan. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var pwdTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let uid = KeychainWrapper.standard.string(forKey: "uid"){
            performSegue(withIdentifier: "FeedVC", sender: nil)
        }
    }
    
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("MADHU: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("MADHU: User cancelled Facebook authentication")
            } else {
                print("MADHU: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("MADHU: Unable to authenticate with Firebase - \(error)")
            } else {
                print("MADHU: Successfully authenticated with Firebase")
                
                if let user = user {
                    KeychainWrapper.standard.set(user.uid, forKey: "uid")
                }
                
                self.performSegue(withIdentifier: "FeedVC", sender: nil)
            }
        })
    }
    @IBAction func signInTapped(_ sender: AnyObject) {
        if let email = emailTextField.text, let pwd = pwdTextField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("MADHU: Email user authenticated with Firebase")
                    if let user = user {
                        KeychainWrapper.standard.set(user.uid, forKey: "uid")
                    }
                    self.performSegue(withIdentifier: "FeedVC", sender: nil)

                    
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("MADHU: Unable to authenticate with Firebase using email")
                        } else {
                            print("MADHU: Successfully authenticated with Firebase")
                            if let user = user {
                                KeychainWrapper.standard.set(user.uid, forKey: "uid")
                            }
                self.performSegue(withIdentifier: "FeedVC", sender: nil)
                        }
                    })
                }
            })
        }
    }


}

