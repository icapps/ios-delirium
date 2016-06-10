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
    
    internal static func localeBundle() -> NSBundle {
        // Fetch your current language.
        var components = NSLocale.componentsFromLocaleIdentifier(NSLocale.currentLocale().localeIdentifier)
        var language = components[NSLocaleLanguageCode]
        
        // When we can't find the bundle we prepare the English bunde.
        var path = deliriumBundle().pathForResource(language, ofType: "lproj")
        if path == nil { path = deliriumBundle().pathForResource("en", ofType: "lproj") }
        return NSBundle(path: path!)!
    }
    
}