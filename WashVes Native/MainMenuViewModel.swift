//
//  MainMenuViewModel.swift
//  WashVes Native
//
//  Created by Dino Pelic on 9/7/17.
//  Copyright © 2017 Dino Pelic. All rights reserved.
//

import Foundation
import UIKit

public enum ItemImage: String {
    case Majice = "1"
    case DugiRukav = "11"
    case KratkiRukav = "12"
    case Dukserica = "13"
    case Kosulja = "14"
    case Bluza = "15"
    case Dzemper = "16"
    
    case Hlace = "2"
    case DugeHlace = "21"
    case Trenerka = "22"
    case Sorc = "23"
    
    case Suknje = "3"
    case DugaSuknja = "31"
    case KratkaSuknja = "32"
    
    case Haljine = "4"
    case DugaHaljina = "41"
    case KratkaHaljina = "42"
    case SvecanaHaljina = "43"
    
    case DonjiVes = "5"
    case Gace = "51"
    case Potkosulja = "52"
    case Grudnjak = "53"
    
    case Jakne = "6"
    case Kaput = "61"
    case JaknaPrava = "62"
    case Mantil = "63"
    
    case Odijela = "7"
    case Sako = "71"
    case OdijelaHlace = "72"
    
    case Dodaci = "8"
    case Carape = "81"
    case Sal = "82"
    case Kapa = "83"
    case Kravata = "84"
    
    case Kucanstvo = "9"
    case Posteljina = "91"
    case Pokrivaci = "92"
    case Jastuk = "93"
    
    case Tamic = "10"
    
    // dodati slike za main iteme
    var itemAvatar: UIImage {
        switch self {
        case .Majice: return #imageLiteral(resourceName: "Majice")
        case .Tamic: return #imageLiteral(resourceName: "Tamic")
        case .Dodaci: return #imageLiteral(resourceName: "Dodaci")
        case .Odijela: return #imageLiteral(resourceName: "Odijela")
        case .Jakne: return #imageLiteral(resourceName: "Jakne")
        case .DonjiVes: return #imageLiteral(resourceName: "DonjiVes")
        case .Haljine: return #imageLiteral(resourceName: "Haljine")
        case .Suknje: return #imageLiteral(resourceName: "Suknje")
        case .Hlace: return #imageLiteral(resourceName: "Hlace")
        default: return #imageLiteral(resourceName: "empty_basket")
        }
    }
}

class MainMenuViewModel: ItemIteractorOutput {
    var mainMenuItemList = ItemsModel()
    
    init() {
        let itemsInteractor = ItemInteractor()
        itemsInteractor.output = self
        itemsInteractor.getAllItems()
    }
    
    func mapSingleItem(item: NSObject) -> SingleItem {
        let name = item.value(forKey: "name") as! String
        let img = item.value(forKey: "img") as! String
        let hasSubItems = item.value(forKey: "hasSubItems") as! Bool
        let subItems = hasSubItems ? item.value(forKey: "subItems") as! NSArray : []
                
        return SingleItem(name: name, img: img, hasSubItems: hasSubItems, subItems: subItems as! [SubItem])
    }
    
    func itemsReceived(object: [String : AnyObject]) {
        mainMenuItemList.itemList = []
        for item in object["clothingItems"] as! NSArray {
            let singleItem: SingleItem = mapSingleItem(item: item as! NSObject)
            mainMenuItemList.itemList.append(singleItem)
        }
        print("mapping done")
    }
    
}
