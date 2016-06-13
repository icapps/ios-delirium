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
        
        // let controller = PinViewController()
        // addChildViewController(controller)
        // view.addSubview(controller.view)
        
        let storyboard = UIStoryboard(name: "PinViewController", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() {
            addChildViewController(controller)
            view.addSubview(controller.view)
        }
    }
    
    // MARK: - PinViewControllerDelegate
    
    func pinViewController(controller: PinViewController, didEnterPin pin: String) {
        print("🔑", pin)
    }
    
}