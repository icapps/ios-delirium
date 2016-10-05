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

class QuickSnapshotSpec: QuickSpec {

    var record = false

    func expect📷ToHaveValidSnapshot(_ view: UIView) {
        if self.record {
            📷(view)
        } else {
            expect(view) == snapshot()
        }
        
    }
    
}
