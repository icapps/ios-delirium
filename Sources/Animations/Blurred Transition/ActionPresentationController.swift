//
//  ActionPresentationController.swift
//  Runway
//
//  Created by Jelle Vandebeeck on 02/01/16.
//  Copyright © 2016 Tracio. All rights reserved.
//

import UIKit

@available(iOS 9, *)
class ActionPresentationController: UIPresentationController {
    // This will be the overlay view that is presented on top
    // of the presening controller's view
    fileprivate var overlayView: UIView?
    
    // MARK: - Configuration
    
    var blurEffectStyle: UIBlurEffectStyle = .light
    
    // MARK: - Presentation
    
    override func presentationTransitionWillBegin() {
        let effect = UIBlurEffect(style: blurEffectStyle)
        overlayView = UIVisualEffectView(effect: effect)
        overlayView?.alpha = 0.0
        overlayView?.translatesAutoresizingMaskIntoConstraints = false
        containerView?.addSubview(overlayView!)
        overlayView?.topAnchor.constraint(equalTo: (containerView?.topAnchor)!).isActive = true
        overlayView?.trailingAnchor.constraint(equalTo: (containerView?.trailingAnchor)!).isActive = true
        overlayView?.bottomAnchor.constraint(equalTo: (containerView?.bottomAnchor)!).isActive = true
        overlayView?.leadingAnchor.constraint(equalTo: (containerView?.leadingAnchor)!).isActive = true
        
        // Add a dismiss gesture tot the overlay view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ActionPresentationController.dismiss(_:)))
        overlayView?.addGestureRecognizer(gesture)

        // Add the presented view to the heirarchy
        containerView?.addSubview(presentedViewController.view)
        
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: {(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.overlayView?.alpha = 0.7
        }, completion:nil)
    }
    
    override var frameOfPresentedViewInContainerView : CGRect {
        let size = presentedViewController.view.intrinsicContentSize
        return CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            overlayView?.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin()  {
        // Fade out the overlay view alongside the transition
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: {(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.overlayView?.alpha = 0.0
        }, completion:nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlayView?.removeFromSuperview()
        }
    }
    
    // MARK: - Gestures
    
    func dismiss(_ sender: AnyObject) {
        if !presentedViewController.resignFirstResponder() {
            presentingViewController.dismiss(animated: true, completion: nil)
        }
    }
}
