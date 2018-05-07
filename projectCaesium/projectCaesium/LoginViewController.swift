//
//  LoginViewController.swift
//  This Custom view controller deals with User Biometric Authentication.
//
//  Created by Stephen Alger.
//  Copyright © 2018 Stephen Alger. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    @IBAction func biometricID(_ sender: UIButton)
    {
        let authContext = LAContext()
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We keep your health data private.", reply:
            {   (wasCorrect, error) in if wasCorrect
                {
                    print("Succesful")
                    self.performSegue(withIdentifier: "LoggedIn", sender: nil)
                } else
                {
                    print("Unsuccesful")
                
                }//end else
            
            })//end reply
                
        }//end if
        
        else
        {
            print("Device does not support biometrics")
        }
    }//end func
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
