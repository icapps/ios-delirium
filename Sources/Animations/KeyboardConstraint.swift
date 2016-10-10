import UIKit

/// Set any NSLayoutConstraint class to a this class and it moves up and down with the keyboard.
open class KeyboardConstraint: NSLayoutConstraint {
    /// this amount is added to the keyboard height
    public var offsetFromKeyboardHeight: CGFloat = 0
    /// will be set on awakeFromNib to the constant value. 
    /// Is used to move back to the position before the keyboard was shown
    public var normalConstant: CGFloat = 0
    public static var animationDuration: TimeInterval = 0.7

    private var notifications: [Any]?  = [Any]()

    override open func awakeFromNib() {
        //swiftlint:disable opening_brace
        normalConstant = constant
        let not1 = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil,
                                               queue: OperationQueue.main)
                    { [weak self] (notification) in
                        let userInfo = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey]
                        if let keyboardSize = (userInfo as? NSValue)?.cgRectValue {
                            let offset = self?.offsetFromKeyboardHeight != nil ? self!.offsetFromKeyboardHeight : 0
                            self?.animate(to: (keyboardSize.height + offset))
                        }
                    }

        let not2 = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide,
                                                          object: nil,
                                                          queue: OperationQueue.main)
                    { [weak self] (notification) in
                        self?.animate(to: self?.normalConstant)
                    }

        notifications?.append(not1)
        notifications?.append(not2)
        super.awakeFromNib()
    }

    private func animate(to newConstant: CGFloat?) {
        guard let newConstant = newConstant else {
            return
        }

        self.constant = newConstant
        UIView.animate(withDuration: KeyboardConstraint.animationDuration) {
            guard let view = self.firstItem as? UIView,
                let view2 = self.firstItem as? UIView else {
                    return
            }
            view.layoutIfNeeded()
            view2.layoutIfNeeded()
        }
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
