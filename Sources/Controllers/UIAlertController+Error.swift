import UIKit

/// When you want to display an `ErrorType` in an `UIAlertController`, than you'll need some more data you want to display. The alert needs a title and a description.
public protocol AlertError: ErrorType {
    
    /// The title that is displayed in the `UIAlertController`.
    var title: String { get }
    
    /// The description that is displayed in the `UIAlertController`.
    var description: String { get }
}

extension UIAlertController {
    
    /// Create a `UIAlertController` instance with the data comming from the `NSError` object.
    ///
    /// We will show the title 'An error occured' by default, except when you overwrite the title. For the description the `localizedDescription` is used that can be set in the `userInfo`.
    ///
    /// - Parameter error: The `NSError` to display in the alert.
    /// - Parameter title: The title can be manually set and is 'An error occured' by default.
    public convenience init(title: String = NSLocalizedString("delirium.alert.title", bundle: NSBundle.deliriumBundle(), comment: ""), error: NSError) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: .Alert)
    }
    
    /// Create a `UIAlertController` instance with the data comming from the `AlertError` conformed object.
    ///
    /// - Parameter error: The `AlertError` to display in the alert.
    public convenience init(error: AlertError) {
        self.init(title: error.title, message: error.description, preferredStyle: .Alert)
    }
    
}

extension UIViewController {
    
    /// Present the `UIAlertController` created from the `NSError` object.
    ///
    /// When you implement the retry closure when calling the `presentAlertController` method, than a 'Try Again' button will be displayed in the alert next to the 'Ok' button.
    ///
    /// - Parameter error: The `NSError` to display in the alert.
    /// - Parameter retry: The closure that is called when the retry button is tapped.
    public func presentAlertController(withError error: NSError, retry: (() -> ())? = nil) {
        let controller = UIAlertController(error: error)
        presentAlertController(controller, retry: retry)
    }
    
    /// Present the `UIAlertController` created from the `AlertError` object.
    ///
    /// When you implement the retry closure when calling the `presentAlertController` method, than a 'Try Again' button will be displayed in the alert next to the 'Ok' button.
    ///
    /// - Parameter error: The `AlertError` to display in the alert.
    /// - Parameter retry: The closure that is called when the retry button is tapped.
    public func presentAlertController(withError error: AlertError, retry: (() -> ())? = nil) {
        let controller = UIAlertController(error: error)
        presentAlertController(controller, retry: retry)
    }
    
    private func presentAlertController(controller: UIAlertController, retry: (() -> ())? = nil) {
        controller.addAction(UIAlertAction(title: NSLocalizedString("delirium.alert.button.ok", bundle: NSBundle.deliriumBundle(), comment: ""), style: .Cancel, handler: nil))
        if let retry = retry {
            controller.addAction(UIAlertAction(title: NSLocalizedString("delirium.alert.button.tryagain", bundle: NSBundle.deliriumBundle(), comment: ""), style: .Default) { action in
                retry()
            })
        }
        presentViewController(controller, animated: true, completion: nil)
    }
    
}