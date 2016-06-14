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
    
    private let configuration: PinConfiguration
    
    // MARK: - Init
    
    init(withConfiguration configuration: PinConfiguration) {
        self.configuration = configuration
    }
    
    // MARK: - Properties
    
    var complete: Bool {
        return code.count == configuration.numberOfDigits
    }
    
    // MARK: - Code
    
    private var code = [Int]()
    
    var codeString: String {
        return code.map { String($0) }.joinWithSeparator("")
    }
    
    // MARK: - Actions
    
    func add(number number: Int) -> Bool {
        guard code.count < configuration.numberOfDigits else {
            return false
        }
        
        code.append(number)
        return true
    }
    
    func clean() {
        code.removeAll()
    }
    
}