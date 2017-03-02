//
//  UIViewController+KeyboardFirstRespondable.swift
//  Pods
//
//  Created by Stijn Willems on 24/02/2017.
//
//

import UIKit

// MARK: - FirstRespondable

/// Implement this to help us move the view you return above the keyboard
public protocol FirstRespondable {
	/// You can optionally implement Keyboardable for a height above the keyboard
	func findFirstResponder() -> UIView?
}

// MARK: - Keyboardable

/// A view can implement this if it wants to be more the 10 points above the keyboard (measured from the bottom of the view).
public protocol Keyboardable {
	var heightAboveKeyboard: CGFloat {get}
}
// MARK: - Scrollable

public protocol Scrollable {
	/// The ScrollView you want the to be used to scroll away from the keyboard
	/// Tip! set keyboardDismissMode = interactive, you can do this in StoryBoarde too.
	weak var scrollView: UIScrollView? {get}
}

// MARK: - KeyboardSateDelegate

/// Default implementation of the protocol. Override if needed.
public extension KeyboardStateDelegate where Self:UIViewController, Self: Scrollable {

	public func keyboardWillTransition(_ state: KeyboardState) {

	}

	/// Default implementation that scrolls the scrollview
	/// More on scrollviews https://www.objc.io/issues/3-views/scroll-view/
	public func keyboardTransitionAnimation(_ state: KeyboardState) {
		switch state {
		case .activeWithHeight(let keyboardHeight):
			do {
				// Adjust insets to be able to scroll content from under the keyboard.

				scrollView?.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight, 0)
				scrollView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, keyboardHeight, 0)

				let firstResponder = try findFirstResponserInAllChildViewControllers()

				// Transfer the bounds of the view you want to scroll to to the coordinates in the root view of the ViewController
				let firstResponderOrigin = firstResponder.convert(firstResponder.bounds.origin, to: view)
				let heightAboveKeyboard = (firstResponder as? Keyboardable)?.heightAboveKeyboard ?? 10

				let yBelowView = (firstResponderOrigin.y + firstResponder.bounds.height + heightAboveKeyboard)
				let viewHeight = self.view.bounds.size.height
				let pointFromBottom = viewHeight - yBelowView

				// Will the firstResponder be below keyboard?

				if pointFromBottom < keyboardHeight {
					let currentOffset =  (scrollView?.contentOffset.y ?? 0)
					let currentInset = (scrollView?.contentInset.bottom ?? 0)
					let offsetY: CGFloat = (keyboardHeight - pointFromBottom) + currentOffset
					if offsetY > 0 {
						let point = CGPoint(x: 0, y: offsetY)
						scrollView?.setContentOffset(point, animated: false)
					}
				}



			} catch {
				print("❓\(error). You should implement FirstRespondable in any ViewController that should move with the Keybaord")
			}
		case .hidden:
			scrollView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
			scrollView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
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


// MARK: - UIViewController FirstResponder helpers

public enum UIViewControllerNotFound: Error {
	case noFirstResponderFound(UIViewController)
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
			throw UIViewControllerNotFound.noFirstResponderFound(self)
		}
	}

}
