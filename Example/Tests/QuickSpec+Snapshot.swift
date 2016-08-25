//
//  QuickSpec+Snapshot.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 25/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

extension QuickSpec {
    
    func expectSnapshot(forView view: UIView, record: Bool = false) {
        if record {
            📷(view)
        } else {
            expect(view) == snapshot()
        }
        
    }
    
}