import UIKit

extension UIAlertController {
    
    public convenience init(error: NSError) {
        self.init(title: "An error occured", message: error.localizedDescription, preferredStyle: .Alert)
    }
    
}

extension UIViewController {
    
    public func presentAlertController(withError error: NSError) {
        let controller = UIAlertController(error: error)
        controller.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
}