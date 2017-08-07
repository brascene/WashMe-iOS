//
//  CheckCodeViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit
import FirebaseAuth

class CheckCodeViewController: UIViewController {

    
    @IBOutlet weak var codeInput: UITextField!
    
    @IBAction func loginAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: codeInput.text!)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            } else {
                print("Phone number: \(user?.phoneNumber)")
                let userInfo = user?.providerData[0]
                print("ProviderId: \(userInfo?.providerID)")
                self.performSegue(withIdentifier: "logged", sender: Any?.self)
            }
        }
    }
    
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
