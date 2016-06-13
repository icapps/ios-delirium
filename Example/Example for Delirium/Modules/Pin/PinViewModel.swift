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
    
    // MARK: - Properties
    
    var complete: Bool {
        return code.count == size
    }
    
    // MARK: - Code
    
    private var code = [Int]()
    
    var codeString: String {
        return code.map { String($0) }.joinWithSeparator("")
    }
    
    // MARK: - Actions
    
    func add(number number: Int) -> Bool {
        guard code.count < size else {
            return false
        }
        
        code.append(number)
        return true
    }
    
    func remove() -> Bool {
        guard code.count > 0 else {
            return false
        }
        
        code.removeLast()
        return true
    }
    
}