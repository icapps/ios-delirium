//
//  AlertViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 10/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    // MARK: - View model
    
    private let viewModel = AlertViewModel()
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
    }
    
    // MARK: - Actions
    
    @IBAction func showError(sender: AnyObject) {
        
    }
    
}