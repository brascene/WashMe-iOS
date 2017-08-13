//
//  MessageScreenViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/12/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class MessageScreenViewController: UIViewController {
    var messageModel = MessageViewModel()
    
    // Outlets
    
    @IBOutlet weak var screenImage: UIImageView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBAction func btnAction(_ sender: UIButton) {
        btnGoTo(sb: messageModel.destinationSB!, vc: messageModel.destinationVC!)
    }
    @IBOutlet weak var screenSubtitle: UILabel!
    @IBOutlet weak var btnOK: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMessage() {
        screenImage.image = messageModel.msgImage
        screenTitle.text = messageModel.msgTitle
        screenSubtitle.text = messageModel.msgSubtitle
        
        btnOK.titleLabel?.text = messageModel.btnText
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
        let nav = UIStoryboard(name: sb, bundle: nil).instantiateInitialViewController() as! WashNavigationViewController
        nav.setViewControllers([destinationVC!], animated: true)
        
        // Set left side controller as root, with main scren also
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        // Pick LeftSideMenu sb and vc
        let sideMenu = UIStoryboard(name: "LeftSideMenu", bundle: nil)
        let sideMenuVC = sideMenu.instantiateViewController(withIdentifier: "LeftSideMenuViewController") as! LeftSideMenuViewController
        let slideMenuController = SlideMenuController(mainViewController: nav, leftMenuViewController: sideMenuVC)
        
        delegate.window?.rootViewController = slideMenuController
        delegate.window?.makeKeyAndVisible()

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
