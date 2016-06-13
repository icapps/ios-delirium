//
//  CustomPinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class CustomPinViewController: UIViewController, PinViewControllerDelegate {
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Enter your pin"
        
        let controller = addPinChildViewController()
        controller.delegate = self
    }
    
    // MARK: - PinViewControllerDelegate
    
    func pinViewController(controller: PinViewController, didEnterPin pin: String) {
        print("🔑", pin)
    }
    
}