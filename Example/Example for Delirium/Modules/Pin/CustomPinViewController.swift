//
//  CustomPinViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

@available(iOS 9, *)
class CustomPinViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var pinView: PinView!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pin Code"

        pinView.delegate = self
    }
    
}

@available(iOS 9, *)
extension CustomPinViewController: PinViewDelegate {

    func pinView(view: PinView, didEnterPin pin: String) {
        print("Entered the correct pin", pin == "1234")
    }

}
