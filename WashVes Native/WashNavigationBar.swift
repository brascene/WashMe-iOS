//
//  WashNavigationBar.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/13/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class WashNavigationBar: UINavigationBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var imageView : UIImageView = UIImageView()
    
    override func draw( _ rect: CGRect) {
        var frame = rect
        
        // 155 height for ipad
        if(UIDevice.current.userInterfaceIdiom == .pad){
            frame.size.height = 155
        }
        else {
            frame.size.height = 71
        }
        self.frame = frame
        super.draw(frame)
        
        /*if(UIDevice.current.userInterfaceIdiom == .pad){
            self.setTitleVerticalPositionAdjustment(-15, for: .default)
        }
        else {
            self.setTitleVerticalPositionAdjustment(-31, for: .default)
        }*/
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.removeFromSuperview()
        
        self.imageView = UIImageView(frame: self.frame)
        self.imageView.image = #imageLiteral(resourceName: "navbarWesh")
        
        self.insertSubview(imageView, at: 0)
        
        let const : CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 35 : 12
        
       /* let classes = [ "_UINavigationBarBackIndicatorView", "UINavigationButton"]
        for view in self.subviews {
            self.bringSubview(toFront: view)
            if(classes.contains(String(describing: type(of: view)))){
                view.frame.origin.y = view.frame.origin.y - const
            }
        } */
    }

}
