import UIKit

/// Set any NSLayoutConstraint class to this class and it moves up and down with the keyboard.
#if os(iOS)
open class KeyboardConstraint: NSLayoutConstraint {
    /// this amount is added to the keyboard height to show the view above the keyboard.
    @IBInspectable public var aboveKeyboard: CGFloat = 15

    // MARK: - PRIVATE

    /// Will be set on awakeFromNib to the constant value.
    /// Is used to move back to the position before the keyboard was shown
    private var normalConstant: CGFloat = 0
    private var notifications: [Any]?  = [Any]()

    override open func awakeFromNib() {
        //swiftlint:disable opening_brace
        normalConstant = constant
        let keyboardWillShow = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil,
                                               queue: OperationQueue.main)
                    { [weak self] (notification) in
                        let userInfo = notification.userInfo
                        let frameInfo = userInfo?[UIKeyboardFrameEndUserInfoKey]
                        if let keyboardSize = (frameInfo as? NSValue)?.cgRectValue {
                            let offset = self?.aboveKeyboard != nil ? self!.aboveKeyboard : 0
                            self?.animate(to: (keyboardSize.height + offset), userInfo: userInfo)
                        }
                    }

        let keyboardWillHide = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide,
                                                          object: nil,
                                                          queue: OperationQueue.main)
                    { [weak self] (notification) in
                        let userInfo = notification.userInfo
                        self?.animate(to: self?.normalConstant, userInfo: userInfo)
                    }

        notifications?.append(keyboardWillShow)
        notifications?.append(keyboardWillHide)
        super.awakeFromNib()
    }

    private func animate(to newConstant: CGFloat?, userInfo: [AnyHashable : Any]?) {
        guard let newConstant = newConstant,
            let duration = (userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curve = (userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue else {
            return
        }

        constant = newConstant
        animateConstraintChange(curve: curve, duration: duration)
    }

    private func animateConstraintChange(curve: UInt, duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: curve), animations: {
            guard   let view = self.firstItem as? UIView,
                    let view2 = self.firstItem as? UIView else {
                    return
            }

            view.superview?.layoutIfNeeded()
            view2.superview?.layoutIfNeeded()

            }, completion: nil)
    }

    deinit {
        guard let notifications = notifications else {
            return
        }

        for notification in notifications {
            NotificationCenter.default.removeObserver(notification)
        }
    }

}
#endif
