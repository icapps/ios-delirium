//
//  UIAlertController+Error.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 08/06/16.
//
//

import UIKit

/// When you want to display an `ErrorType` in an `UIAlertController`, than you'll need some more data you want to display. The alert needs a title and a description.
public protocol AlertError: Error {
    
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
    public convenience init(title: String = "delirium.alert.title".localizedString, error: NSError) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: .alert)
    }
    
    /// Create a `UIAlertController` instance with the data comming from the `AlertError` conformed object.
    ///
    /// - Parameter error: The `AlertError` to display in the alert.
    public convenience init(error: AlertError) {
        self.init(title: error.title, message: error.description, preferredStyle: .alert)
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
    
    fileprivate func presentAlertController(_ controller: UIAlertController, retry: (() -> ())? = nil) {
        controller.addAction(UIAlertAction(title: "delirium.alert.button.ok".localizedString, style: .cancel, handler: nil))
        if let retry = retry {
            controller.addAction(UIAlertAction(title: "delirium.alert.button.tryagain".localizedString, style: .default) { action in
                retry()
            })
        }
        present(controller, animated: true, completion: nil)
    }
    
}
