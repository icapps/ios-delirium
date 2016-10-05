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
    
    fileprivate let viewModel = AlertViewModel()
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
    }
    
    // MARK: - Actions
    
    @IBAction func showError(_ sender: AnyObject) {
        presentAlertController(with: viewModel.error)
    }
    
    @IBAction func showErrorType(_ sender: AnyObject) {
        presentAlertController(with: viewModel.errorType)
    }
    
    @IBAction func showRetryError(_ sender: AnyObject) {
        presentAlertController(with: viewModel.errorType) {
            print("🎯 Tapped retry")
        }
    }
    
}
