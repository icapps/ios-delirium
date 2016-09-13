//
//  MultiPickerViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class MultiPickerViewController: UIViewController {

    // MARK: - Actions
    
    @IBAction func presentDatePicker(sender: AnyObject) {
        print("🎯 Tapped present date picker")
    }
    
    @IBAction func presentSingleSelectPicker(sender: AnyObject) {
        print("🎯 Tapped present single select picker")
    }

}
