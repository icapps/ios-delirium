//
//  PieChartViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class PieChartViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var constraints: [NSLayoutConstraint]!
    @IBOutlet var chart: PieChartView!

    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pie Chart"
        
        chart.overlayPadding = 25.0
        
        // Add slices to the chart.
        chart.add(slice: PieChartSlice(value: 5.46, color: UIColor(red:0.02,green:0.22,blue:0.40,alpha:1.00)))
        chart.add(slice: PieChartSlice(value: 12.41, color: UIColor(red:0.11,green:0.50,blue:0.72,alpha:1.00)))
        chart.add(slice: PieChartSlice(value: 16.71, color: UIColor(red:0.11,green:0.68,blue:0.93,alpha:1.00)))
        chart.add(slice: PieChartSlice(value: 4.02, color: UIColor(red:0.13,green:0.77,blue:0.93,alpha:1.00)))
        chart.add(slice: PieChartSlice(value: 23.72, color: UIColor(red:0.87,green:0.84,blue:0.90,alpha:1.00)))
        chart.add(slice: PieChartSlice(value: 37.67, color: UIColor(red:0.89,green:0.89,blue:0.89,alpha:1.00)))
    }
    
    // MARK: - Actions
    
    @IBAction func toggleSize(sender: AnyObject) {
        for constraint in constraints {
            constraint.priority = constraint.priority == 800 ? 700 : 800
        }
    }

}
