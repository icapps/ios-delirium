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
        
        // Add slices to the chart.
        chart.add(slice: PieChartSlice(value: 5.46, color: UIColor.redColor()))
        chart.add(slice: PieChartSlice(value: 12.41, color: UIColor.greenColor()))
        chart.add(slice: PieChartSlice(value: 16.71, color: UIColor.blueColor()))
        chart.add(slice: PieChartSlice(value: 4.02, color: UIColor.yellowColor()))
        chart.add(slice: PieChartSlice(value: 23.72, color: UIColor.grayColor()))
        chart.add(slice: PieChartSlice(value: 37.67, color: UIColor.grayColor()))
    }
    
    // MARK: - Actions
    
    @IBAction func toggleSize(sender: AnyObject) {
        for constraint in constraints {
            constraint.priority = constraint.priority == 800 ? 700 : 800
        }
    }

}
