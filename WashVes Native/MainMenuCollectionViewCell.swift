//
//  MainMenuCollectionViewCell.swift
//  WashVes Native
//
//  Created by Dino Pelic on 9/8/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import UIKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    let scaledImgSize:CGFloat = 90
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupItemCell(name: String, image: String) {
        let itemType: ItemImage = ItemImage(rawValue: image)!
        let scaledImage = UIImage.scaleImage(image: itemType.itemAvatar, toWidth: scaledImgSize, andHeight: scaledImgSize)
        itemImage.image = scaledImage
        itemTitle.text = name
    }

}
