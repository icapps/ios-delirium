//
//  PieChartSlice.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

/// The `PieChartSlice` is responsible for a slice that is displayed in the pie chart.
@objc public protocol PieChartSlice {
    
    /// The value can be any given number. When calculating the size of the slice we will take the sum of all the values into account and calculate the relative size of the slice depening on the value.
    var value: Float { get }
    
    /// The ring color of the slice.
    var color: UIColor { get }
    
}