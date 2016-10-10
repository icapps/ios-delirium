import UIKit

/// Set any NSLayoutConstraint class to this class and it moves up and down with the keyboard.
open class KeyboardConstraint: NSLayoutConstraint {
    /// this amount is added to the keyboard height to show the view above the keyboard.
    public var offsetFromKeyboardHeight: CGFloat = 15
    /// will be set on awakeFromNib to the constant value. 
    /// Is used to move back to the position before the keyboard was shown
    public var normalConstant: CGFloat = 0

    private var notifications: [Any]?  = [Any]()

    override open func awakeFromNib() {
        //swiftlint:disable opening_brace
        normalConstant = constant
        let not1 = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil,
                                               queue: OperationQueue.main)
                    { [weak self] (notification) in
                        let userInfo = notification.userInfo
                        let frameInfo = userInfo?[UIKeyboardFrameBeginUserInfoKey]
                        if let keyboardSize = (frameInfo as? NSValue)?.cgRectValue {
                            let offset = self?.offsetFromKeyboardHeight != nil ? self!.offsetFromKeyboardHeight : 0
                            self?.animate(to: (keyboardSize.height + offset), userInfo: userInfo)
                        }
                    }

        let not2 = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide,
                                                          object: nil,
                                                          queue: OperationQueue.main)
                    { [weak self] (notification) in
                        let userInfo = notification.userInfo
                        self?.animate(to: self?.normalConstant, userInfo: userInfo)
                    }

        notifications?.append(not1)
        notifications?.append(not2)
        super.awakeFromNib()
    }

    private func animate(to newConstant: CGFloat?, userInfo: [AnyHashable : Any]?) {
        guard let newConstant = newConstant,
            let duration = (userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curve = (userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue else {
            return
        }

        self.constant = newConstant
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: curve), animations: {
            guard let view = self.firstItem as? UIView,
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
