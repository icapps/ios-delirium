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
        
        let controller = PickerViewController(referenceView: sender as! UIButton)
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func presentSingleSelectPicker(sender: AnyObject) {
        print("🎯 Tapped present single select picker")
        
        let controller = PickerViewController(referenceView: sender as! UIButton)
        presentViewController(controller, animated: true, completion: nil)
    }

}
