//
//  PieChartViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class Slice: PieChartSlice {
    @objc var value: Float
    @objc var color: UIColor

    init(value: Float, color: UIColor) {
        self.value = value
        self.color = color
    }
}

class PieChartViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var constraints: [NSLayoutConstraint]!
    @IBOutlet var chart: PieChartView!

    // MARK: - View flow

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Pie Chart"

        chart.overlayPadding = 25.0
        chart.overlayColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)

        // Add slices to the chart.
        chart.add(slice: Slice(value: 5.46, color: UIColor(red:0.16, green:0.55, blue:0.55, alpha:1.00)))
        chart.add(slice: Slice(value: 12.41, color: UIColor(red:0.44, green:0.81, blue:0.80, alpha:1.00)))
        chart.add(slice: Slice(value: 16.71, color: UIColor(red:0.98, green:0.90, blue:0.40, alpha:1.00)))
        chart.add(slice: Slice(value: 4.02, color: UIColor(red:0.93, green:0.45, blue:0.20, alpha:1.00)))
        chart.add(slice: Slice(value: 23.72, color: UIColor(red:0.57, green:0.86, blue:0.63, alpha:1.00)))
        chart.add(slice: Slice(value: 37.67, color: UIColor(red:0.28, green:0.24, blue:0.25, alpha:1.00)))
    }

    // MARK: - Actions

    @IBAction func toggleSize(_ sender: AnyObject) {
        for constraint in constraints {
            constraint.priority = constraint.priority == 800 ? 700 : 800
        }
    }

}
