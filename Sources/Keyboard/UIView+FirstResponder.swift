import UIKit

public extension UIView {

	/// Recursivaly looks for the firstResponder in all the subviews subviews.
	/// # WARNING
	/// **Use this method sparingly.**
	/// Can potentialy take a very long time depending on how many subviews the subviews have.
	public func currentFirstResponder() -> UIView? {
		if self.isFirstResponder {
			return self
		}

		for view in self.subviews {
			if let responder = view.currentFirstResponder() {
				return responder
			}
		}

		return nil
	}

}
