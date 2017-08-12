//
//  MessageScreenViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/12/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class MessageScreenViewController: UIViewController {
    var msgImage: UIImage?
    var msgTitle: String?
    var msgSubtitle: String?
    var btnText: String?
    
    var destinationSB: String?
    var destinationVC: String?
    
    // Outlets
    
    @IBOutlet weak var screenImage: UIImageView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBAction func btnAction(_ sender: UIButton) {
        btnGoTo(sb: self.destinationSB!, vc: self.destinationVC!)
    }
    @IBOutlet weak var screenSubtitle: UILabel!
    @IBOutlet weak var btnOK: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMessage()
        self.navigationController?.setViewControllers([self], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMessage() {
        screenImage.image = msgImage
        screenTitle.text = msgTitle
        screenSubtitle.text = msgSubtitle
        
        btnOK.titleLabel?.text = btnText
        btnOK.layer.cornerRadius = 20
    }
    
    func getViewController(storyboard: String, name: String) -> UIViewController? {
        if name == "MainMenu" {
            let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: name) as! MainMenuViewController
            return vc
        } else {
            return nil
        }
    }
    
    func btnGoTo(sb: String, vc: String) {
        let destinationVC = getViewController(storyboard: sb, name: vc)
        self.navigationController?.pushViewController(destinationVC!, animated: true)
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
