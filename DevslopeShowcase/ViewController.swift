//
//  ViewController.swift
//  DevslopeShowcase
//
//  Created by SEBASTIEN MONTIBELLER on 24/03/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        }
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!){
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions( [ "email" ], fromViewController: self ) { ( facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            
            if facebookError != nil {
                
                print( "Facebook login failed. Error: \( facebookError )" )
                
            } else {
                
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                
                print( "Successfully logged in with facebook. \( accessToken )" )
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                
                if error != nil {
                    print("Login failed. \(error)")
                    
                } else {
                    
                    print ("Logged In!\(authData)")
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    
                    }
                
            })
            
        }
    }

}

}