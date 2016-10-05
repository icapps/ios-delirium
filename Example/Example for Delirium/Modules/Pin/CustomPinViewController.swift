//
//  CustomPinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class CustomPinViewController: UIViewController {
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pin Code"
    }
    
    // MARK: - Actions
    
    @IBAction func setupPinCode(_ sender: AnyObject) {
        let configuration = PinConfiguration()
        let controller = pinViewController(withConfiguration: configuration)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension UIViewController: PinViewControllerDelegate {
    
    public func pinViewController(_ controller: PinViewController, didEnterPin pin: String) {
        let controller = UIAlertController(title: "Pin code", message: "The pincode you entered is \(pin).", preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    
}
