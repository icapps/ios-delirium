//
//  UIViewController+KeyboardFirstRespondable.swift
//  Pods
//
//  Created by Stijn Willems on 24/02/2017.
//
//

import UIKit

// MARK: - FirstRespondable
public protocol FirstRespondable {
	/// You can optionally implement Keyboardable for a height above the keyboard
	func findFirstResponder() -> UIView?
}

// MARK: - Keyboardable
public protocol Keyboardable {
	var heightAboveKeyboard: CGFloat {get}
}
// MARK: - Scrollable

public protocol Scrollable {
	weak var scrollView: UIScrollView? {get}
}

// MARK: - KeyboardSateDelegate
public extension KeyboardStateDelegate where Self:UIViewController, Self: Scrollable {

	public func keyboardWillTransition(_ state: KeyboardState) {

	}

	public func keyboardTransitionAnimation(_ state: KeyboardState) {
		switch state {
		case .activeWithHeight(let height):
			do {
				let firstResponder = try findFirstResponserInAllChildViewControllers()

				let firstResponderOrigin = firstResponder.convert(firstResponder.bounds.origin, to: view)
				let heightAboveKeyboard = (firstResponder as? Keyboardable)?.heightAboveKeyboard ?? 10

				let yBelowView = (firstResponderOrigin.y + firstResponder.bounds.height + heightAboveKeyboard)
				let viewHeight = self.view.bounds.size.height
				let pointFromBottom = viewHeight - yBelowView

				// Will be below keyboard?
				if pointFromBottom < height {
					let currentOffset =  (scrollView?.contentOffset.y ?? 0)
					let offsetY: CGFloat = (height - pointFromBottom) + currentOffset
					if offsetY > 0 {
						let point = CGPoint(x: 0, y: offsetY)
						scrollView?.setContentOffset(point, animated: false)
					}
				}

			} catch {
				print("❓\(error) in \(self). You should implement FirstRespondable in any ViewController that should move with the Keybaord")
			}
		default:
			break
		}
	}

	public func keyboardDidTransition(_ state: KeyboardState) {
		switch state {
		case .hidden:
			scrollView?.setContentOffset(CGPoint.zero, animated: true)
		default:
			break
		}

	}
}


// MARK: - FirstResponder helpers

public enum UIViewControllerNotFound: Error {
	case noFirstResponderFound
}

public extension UIViewController {

	public func findFirstResponserInAllChildViewControllers() throws -> UIView {
		if let view = (self as? FirstRespondable)?.findFirstResponder() {
			return view
		} else {
			for child  in childViewControllers {
				if let child = child as? FirstRespondable {
					if let result = child.findFirstResponder() {
						return result
					}
				}
			}
			throw UIViewControllerNotFound.noFirstResponderFound
		}
	}

}

// MARK: - Hide Keyboard

public extension UIViewController {

	public func hideKeyBoard() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
		                                                         action: #selector(UIViewController.dismissKeyboard))

		view.addGestureRecognizer(tap)
	}

	public func dismissKeyboard() {
		view.endEditing(true)
	}

}
