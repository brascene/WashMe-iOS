//
//  GetCodeViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit
import FirebaseAuth

class GetCodeViewController: UIViewController {
    @IBOutlet weak var phoneInput: UITextField!
    
    @IBAction func getCodeAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Phone number", message: "Is this your phone number? \(phoneInput.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) { (alertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneInput.text!) { (verificationID, error) in
                if error != nil {
                    print("Error: \(String(describing: error?.localizedDescription))")
                } else {
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.performSegue(withIdentifier: "checkCode", sender: Any?.self)
                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
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
