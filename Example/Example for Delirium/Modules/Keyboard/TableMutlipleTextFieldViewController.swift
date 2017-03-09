//
//  TableMutlipleTextFieldViewController.swift
//  Delirium
//
//  Created by Stijn Willems on 02/03/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Delirium

class TableMutlipleTextFieldViewController: UITableViewController, FirstRespondable {

	@IBOutlet var keyboardCandidates: [UIView]!

	// MARK: - FirstRespondable

	func findFirstResponder() -> UIView? {
		return keyboardCandidates.first {$0.isFirstResponder}
	}

}
