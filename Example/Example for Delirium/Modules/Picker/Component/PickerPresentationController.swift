//
//  PickerPresentationController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

@available(iOS 9, *)
class PickerPresentationController: UIPresentationController, UIAdaptivePresentationControllerDelegate {
    // This will be the overlay view that is presented on top
    // of the presening controller's view
    private var overlayView: UIView?
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
        self.delegate = self
    }
    
    // MARK: - Presentation
    
    override func presentationTransitionWillBegin() {
        overlayView = UIView()
        overlayView?.alpha = 0.0
        overlayView?.backgroundColor = UIColor.redColor()
        overlayView?.translatesAutoresizingMaskIntoConstraints = false
        containerView?.addSubview(overlayView!)
        overlayView?.topAnchor.constraintEqualToAnchor(containerView?.topAnchor).active = true
        overlayView?.trailingAnchor.constraintEqualToAnchor(containerView?.trailingAnchor).active = true
        overlayView?.bottomAnchor.constraintEqualToAnchor(containerView?.bottomAnchor).active = true
        overlayView?.leadingAnchor.constraintEqualToAnchor(containerView?.leadingAnchor).active = true
        
        // Add a dismiss gesture tot the overlay view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(PickerPresentationController.dismiss(_:)))
        overlayView?.addGestureRecognizer(gesture)
        
        // Add the presented view to the heirarchy
        containerView?.addSubview(presentedViewController.view)
        
        let transitionCoordinator = self.presentingViewController.transitionCoordinator()
        transitionCoordinator?.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.overlayView?.alpha = 0.7
            }, completion:nil)
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        let size = presentedViewController.view.intrinsicContentSize()
        return CGRectMake(0, 0, size.width, size.height)
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        if !completed {
            overlayView?.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin()  {
        // Fade out the overlay view alongside the transition
        let transitionCoordinator = self.presentingViewController.transitionCoordinator()
        transitionCoordinator?.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.overlayView?.alpha = 0.0
            }, completion:nil)
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            overlayView?.removeFromSuperview()
        }
    }
    
    // MARK: - Gestures
    
    func dismiss(sender: AnyObject) {
        if !presentedViewController.resignFirstResponder() {
            presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}