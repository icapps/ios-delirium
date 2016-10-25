//
//  KeyboardViewController.swift
//  Delirium
//
//  Created by Stijn Willems on 10/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class KeyboardViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var keyboardConstraint: KeyboardConstraint! {
        didSet {
            keyboardConstraint.aboveKeyboard = 25
        }
    }

    @IBAction func tapOutsideTextfield(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

}

extension KeyboardViewController: UITextFieldDelegate {

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
