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
    public convenience init(title: String = "An error occured", error: NSError) {
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
    /// - Parameter error: The `NSError` to display in the alert.
    public func presentAlertController(withError error: NSError) {
        let controller = UIAlertController(error: error)
        controller.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    /// Present the `UIAlertController` created from the `AlertError` object.
    ///
    /// - Parameter error: The `AlertError` to display in the alert.
    public func presentAlertController(withError error: AlertError) {
        let controller = UIAlertController(error: error)
        controller.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
}