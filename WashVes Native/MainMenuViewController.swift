//
//  MainMenuViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/12/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Choose items"
        
        if(UIDevice.current.userInterfaceIdiom == .pad){
            self.addLeftBarButtonWithImage(#imageLiteral(resourceName: "hamburger"))
            // change font
        }
        else {
            self.addLeftBarButtonWithImage(#imageLiteral(resourceName: "hamburger"))
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        }
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
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
