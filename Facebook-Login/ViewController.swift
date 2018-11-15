//
//  ViewController.swift
//  Facebook-Login
//
//  Copyright © 2018 Haresh Gediya. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getUserData() {
        
        let path = "me"
        let param = ["fields": "id, name, first_name, last_name, email, gender, location, picture.type(large)"]
        
        if FBSDKAccessToken.current() != nil {
            
            FBSDKGraphRequest(graphPath: path, parameters: param)?.start(completionHandler: { (connection, result, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    
                    let userData = result as! [String: AnyObject]
                    
                    let id = userData["id"] as! String
                    let name = userData["name"] as! String
                    let firstName = userData["first_name"] as! String
                    let lastName = userData["last_name"] as! String
                    let email = userData["email"] as! String
                    let gender = userData["gender"] as! String
                    let pictureUrl = userData["picture"] as! [String:Any]
                    let photoData = pictureUrl["data"] as! [String:Any]
                    let photoUrl = photoData["url"] as! String
                    
                    print(id, name, firstName, lastName, email, gender, photoUrl)
                    
                }
                
            })
        }
        
    }

    @IBAction func onBtnFacebookLogin(_ sender: UIButton) {
        
        let facebookLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        facebookLoginManager.logOut()
        
        if((FBSDKAccessToken.current()) == nil) {
            
            facebookLoginManager.logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: { (result, error) -> Void in
                
                if error == nil && !(result?.isCancelled)! {
                    // get user data
                    self.getUserData()
                } else {
                    print(error!.localizedDescription)
                }
                
            })
            
        }
    }

}

