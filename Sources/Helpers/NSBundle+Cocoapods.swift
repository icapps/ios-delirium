//
//  NSBundle+Cocoapods.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 08/06/16.
//
//

import Foundation

class BaseBundle {}

extension NSBundle {
    
    internal static func deliriumBundle() -> NSBundle {
        let bundlePath = NSBundle(forClass: BaseBundle.self).pathForResource("Delirium", ofType: "bundle")!
        return NSBundle(path: bundlePath)!
    }
    
}