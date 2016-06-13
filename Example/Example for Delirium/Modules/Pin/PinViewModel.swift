//
//  PinViewModel.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

class PinViewModel {
    
    // MARK: - Configuration
    
    private let size: Int = 4
    
    // MARK: - Code
    
    private var code = [Int]()
    
    var codeString: String {
        return code.map { String($0) }.joinWithSeparator("")
    }
    
    // MARK: - Actions
    
    func add(number number: Int) {
        guard code.count < size else {
            return
        }
        
        code.append(number)
        print("🍞", codeString)
    }
    
    func remove() {
        guard code.count > 0 else {
            return
        }
        
        code.removeLast()
        print("❌", codeString)
    }
    
}