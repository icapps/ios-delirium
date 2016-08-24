//
//  PieChartSlice.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

/// The `PieChartSlice` is responsible for a slice that is displayed in the pie chart.
public struct PieChartSlice {
    
    /// The value can be any given number. When calculating the size of the slice we will take the sum of all the values into account and calculate the relative size of the slice depening on the value.
    public var value: Float
    
    /// The outer ring color of the slice.
    public var color: UIColor
    
    /// We need a value and a color in order to properly initialize the slice.
    ///
    /// - Parameter value: The given value
    /// - Parameter color: The given color
    public init(value: Float, color: UIColor) {
        self.value = value
        self.color = color
    }
}