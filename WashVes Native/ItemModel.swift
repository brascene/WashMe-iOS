//
//  ItemModel.swift
//  WashVes Native
//
//  Created by Dino Pelic on 9/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class SubItem: Mappable {
    var name: String?
    var key: Int?
    var img: UIImage?
    var unitPrice: Int = -1
    
    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        key <- map["key"]
        img <- map["img"]
        unitPrice <- map["unitPrice"]
    }
}

class SingleItem: Mappable {
    var name: String = ""
    var key: Int = -1
    var img: String = ""
    var hasSubItems: Bool = false
    var subItems: [SubItem] = [SubItem]()
    
    init(name: String, img: String, hasSubItems: Bool, subItems: [SubItem]) {
        self.name = name
        self.img = img
        self.hasSubItems = hasSubItems
        self.subItems = subItems
    }
    
    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        key <- map["key"]
        img <- map["img"]
        hasSubItems <- map["hasSubItems"]
        subItems <- map["subItems"]
    }
}

class ItemsModel: Mappable {
    var itemList: [SingleItem] = [SingleItem]()

    required convenience init?(map: Map) {
        self.init(map: map)
    }
    
    func mapping(map: Map) {
        itemList <- map["clothingItems"]
    }
}
