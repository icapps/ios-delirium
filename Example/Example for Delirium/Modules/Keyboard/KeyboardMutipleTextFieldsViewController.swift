//
//  KeyboardMutipleTextFieldsViewController.swift
//  Delirium
//
//  Created by Stijn Willems on 02/03/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class TextFieldWithSpecialHeightAboveKeyboard: UITextField, Keyboardable {
	 @IBInspectable var heightAboveKeyboard: CGFloat = 50
}

class KeyboardMutipleTextFieldsViewController: UIViewController, Scrollable, KeyboardStateDelegate, FirstRespondable {

	@IBOutlet var scrollView: UIScrollView?
	@IBOutlet var keyboardCandidates: [UIView]!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		registerForKeyboardNotifications(self)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		unregisterFromKeyboardNotifications()
	}

	// MARK: - FirstRespondable

	/// Implement this function to be fast. Try to limit the number of views to iterate through when searching for a FirstResponder.
	func findFirstResponder() -> UIView? {
		return keyboardCandidates.first {$0.isFirstResponder}
	}
	
}
