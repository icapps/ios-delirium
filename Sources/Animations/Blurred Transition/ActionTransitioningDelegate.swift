//
//  ActionTransitioningDelegate.swift
//  Runway
//
//  Created by Jelle Vandebeeck on 02/01/16.
//  Copyright © 2016 Tracio. All rights reserved.
//

import UIKit

@available(iOS 9, *)
public class ActionTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK: - Configuration
    
    public var blurEffectStyle: UIBlurEffectStyle = .Light
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    public func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = ActionPresentationController(presentedViewController: presented, presentingViewController: presenting)
        presentationController.blurEffectStyle = blurEffectStyle
        return presentationController
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionPresentationAnimationController(isPresenting: true)
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionPresentationAnimationController(isPresenting: false)
    }
}