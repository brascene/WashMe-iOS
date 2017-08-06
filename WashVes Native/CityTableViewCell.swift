//
//  CityTableViewCell.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/6/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellCity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup (city: String) {
        self.cellCity.text = city
    }
    
    func setLabelRadius (rectMask: UIRectCorner) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.cellCity.frame
        rectShape.position = self.cellCity.center
        
        rectShape.path = UIBezierPath(roundedRect: self.cellCity.bounds, byRoundingCorners: rectMask, cornerRadii: CGSize(width: 50, height: 50)).cgPath
        
        self.cellCity.layer.mask = rectShape
    }
    
}
