//
//  CustomPinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class CustomPinViewController: UIViewController {
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pin Code"
    }
    
    // MARK: - Actions
    
    @IBAction func setupPinCode(sender: AnyObject) {
        let configuration = PinConfiguration()
        let controller = pinViewController(withConfiguration: configuration)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension UIViewController: PinViewControllerDelegate {
    
    func pinViewController(controller: PinViewController, didEnterPin pin: String) {
        let controller = UIAlertController(title: "Pin code", message: "The pincode you entered is \(pin).", preferredStyle: .Alert)
        controller.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(controller, animated: true, completion: nil)
    }
    
}