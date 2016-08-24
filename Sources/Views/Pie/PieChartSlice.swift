//
//  PieChartSlice.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

public struct PieChartSlice {
    public var value: Float
    public var color: UIColor
    
    public init(value: Float, color: UIColor) {
        self.value = value
        self.color = color
    }
}