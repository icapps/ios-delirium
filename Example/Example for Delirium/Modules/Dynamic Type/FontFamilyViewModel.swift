//
//  FontFamilyViewModel.swift
//  Delirium
//
//  Created by Nikki Vergracht on 31/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class FontFamilyViewModel {
    
    let familyNames = UIFont.familyNames
    
    var title: String {
        return "UIFont Dynamic Type"
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return familyNames.count
    }
    
    func familyName(for indexPath: IndexPath) -> String {
        return familyNames[indexPath.row]
    }
    
}
