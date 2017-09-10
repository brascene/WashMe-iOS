//
//  ItemService.swift
//  WashVes Native
//
//  Created by Dino Pelic on 9/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation

class ItemService: BaseService {
    
    var output: ServiceOutput?
    
    func getAllItems() {
        let result = self.getAllItemsFromLocal(jsonPath: "items")
        output?.resultForCall(object: result, error: nil)
    }

}
