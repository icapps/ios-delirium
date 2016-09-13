//
//  PickerTransitioningDelegate.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

@available(iOS 9, *)
public class PickerTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    public func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = PickerPresentationController(presentedViewController: presented, presentingViewController: presenting)
        return presentationController
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PickerPresentationAnimationController(isPresenting: true)
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PickerPresentationAnimationController(isPresenting: false)
    }
}