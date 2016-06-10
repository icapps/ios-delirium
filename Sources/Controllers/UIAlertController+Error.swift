import UIKit

public protocol AlertError: ErrorType {
    
    var title: String { get }
    var description: String { get }
}

extension UIAlertController {
    
    public convenience init(error: NSError) {
        self.init(title: "An error occured", message: error.localizedDescription, preferredStyle: .Alert)
    }
    
    public convenience init(error: AlertError) {
        self.init(title: error.title, message: error.description, preferredStyle: .Alert)
    }
    
}

extension UIViewController {
    
    public func presentAlertController(withError error: NSError) {
        let controller = UIAlertController(error: error)
        controller.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    public func presentAlertController(withError error: AlertError) {
        let controller = UIAlertController(error: error)
        controller.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
}