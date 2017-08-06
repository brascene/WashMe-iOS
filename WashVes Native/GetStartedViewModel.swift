//
//  GetStartedViewModel.swift
//  WashVes Native
//
//  Created by Dino Pelic on 8/6/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation

class GetStartedViewModel {
    var cities: [String] = []
    var choosenCity: String?
    
    init () {
        cities = ["Sarajevo", "Konjic", "Mostar"]
        choosenCity = ""
    }
}
