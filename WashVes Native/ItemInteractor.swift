//
//  ItemInteractor.swift
//  WashVes Native
//
//  Created by Dino Pelic on 9/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation

protocol ItemIteractorOutput {
    func itemsReceived(object: [String: AnyObject])
}

class ItemInteractor: ServiceOutput {
    var service: ItemService = ItemService()
    var output: ItemIteractorOutput?
    
    init() {
        service.output = self
    }
    
    func getAllItems() {
        service.getAllItems()
    }
    
    func resultForCall(object: [String : AnyObject]?, error: Error?) {
        if error == nil {
            output?.itemsReceived(object: object!)
        }
    }
}
