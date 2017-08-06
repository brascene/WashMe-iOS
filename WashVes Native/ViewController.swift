//
//  ViewController.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/5/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var splashImage: UIImageView!
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        splashImage.transform = CGAffineTransform.init(scaleX: 0.05, y: 0.05)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: .curveEaseIn, animations: {
         self.splashImage.transform = CGAffineTransform.identity
        }, completion: {
            success in
            if success {
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.showGetStartedScreen), userInfo: nil, repeats: false)
            }
        })
    }
    
    func showGetStartedScreen () {
        let sb = UIStoryboard(name: "GetStarted", bundle: nil)
        let getStartedVC = sb.instantiateViewController(withIdentifier: "getStarted")
        self.present(getStartedVC, animated: false, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

