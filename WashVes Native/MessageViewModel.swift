//
//  File.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/13/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation
import UIKit

class MessageViewModel {
    var msgImage: UIImage?
    var msgTitle: String?
    var msgSubtitle: String?
    var btnText: String?
    
    var destinationSB: String?
    var destinationVC: String?
    
    init() {
        
    }
    
    init(msgImage: UIImage, msgTitle: String, msgSubtitle: String, btnText: String, dsb: String, dvc: String) {
        self.msgImage = msgImage
        self.msgTitle = msgTitle
        self.msgSubtitle = msgSubtitle
        self.btnText = btnText
        self.destinationSB = dsb
        self.destinationVC = dvc
    }
}
