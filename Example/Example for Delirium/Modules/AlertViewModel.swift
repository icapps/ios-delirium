//
//  AlertViewModel.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

class AlertViewModel {
    
    var title: String {
        return "Alert"
    }
    
    var error: NSError {
        let userInfo = [
            NSLocalizedDescriptionKey: "An error occured fetching the data"
        ]
        return NSError(domain: "com.icapps.delirium", code: 1, userInfo: userInfo)
    }
    
}