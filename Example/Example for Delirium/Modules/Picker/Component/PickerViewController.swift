//
//  PickerViewController.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 13/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
    
    // MARK: - Internals
    
    private var transitionDelegate: UIViewControllerTransitioningDelegate?
    
    // MARK: - Outlet
    
    @IBOutlet var clearButton: UIButton!
    
    // MARK: - Properties
    
    var referenceView: UIView?
    
    // MARK: - Init
    
    convenience init(referenceView: UIView) {
        self.init(nibName: "PickerViewController", bundle: nil)
        
        self.referenceView = referenceView
        preparePopover()
    }
    
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Clear
    
    @IBAction func clear(sender: AnyObject) {
        clearSelection()
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func clearSelection() {
        assert(false, "💀 `func clearSelection()` not implemented")
    }
    
    // MARK: - Popover
    
    private func preparePopover() {
        modalPresentationStyle = .Popover
        if UIScreen.mainScreen().traitCollection.userInterfaceIdiom == .Phone {
            if #available(iOS 9, *) {
                modalPresentationStyle = .Custom
                transitionDelegate = PickerTransitioningDelegate()
                transitioningDelegate = transitionDelegate
            }
        }
        preferredContentSize = view.systemLayoutSizeFittingSize(CGSizeZero)
        
        popoverPresentationController?.permittedArrowDirections = .Up
        popoverPresentationController?.backgroundColor = view.backgroundColor
        if let referenceView = referenceView {
            popoverPresentationController?.sourceView = referenceView
            popoverPresentationController?.sourceRect = referenceView.bounds
        }
    }

}