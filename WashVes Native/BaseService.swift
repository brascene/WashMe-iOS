//
//  BaseService.swift
//  WashVes Native
//
//  Created by Dino Pelic on 9/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation

protocol ServiceOutput {
    func resultForCall (object: [String:AnyObject]?, error: Error?)
}

class BaseService {
        
    func getAllItemsFromLocal(jsonPath : String) -> [String: AnyObject]? {
        if let path = Bundle.main.path(forResource: jsonPath, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    return jsonResult as? [String : AnyObject]
                } catch {
                    return nil
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}
