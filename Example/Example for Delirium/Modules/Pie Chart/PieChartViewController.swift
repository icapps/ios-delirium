//
//  PieChartViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 23/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var constraints: [NSLayoutConstraint]!

    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pie Chart"
    }
    
    // MARK: - Actions
    
    @IBAction func toggleSize(sender: AnyObject) {
        for constraint in constraints {
            constraint.priority = constraint.priority == 800 ? 700 : 800
        }
    }

}
