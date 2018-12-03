//
//  NSBundle+Cocoapods.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 08/06/16.
//
//

import Foundation

class BaseBundle {}

extension Bundle {
    
    static func deliriumBundle() -> Bundle {
        let bundlePath = Bundle(for: BaseBundle.self).path(forResource: "Delirium", ofType: "bundle")!
        return Bundle(path: bundlePath)!
    }
    
    fileprivate static func localeBundle() -> Bundle {
        // Fetch your current language.
        let components = Locale.components(fromIdentifier: Locale.current.identifier)
        let language = components[Locale.current.languageCode!]
        
        // When we can't find the bundle we prepare the English bunde.
        var path = deliriumBundle().path(forResource: language, ofType: "lproj")
        if path == nil { path = deliriumBundle().path(forResource: "en", ofType: "lproj") }
        return Bundle(path: path!)!
    }
    
}

public extension String {
    
    public var localizedString: String {
        return NSLocalizedString(self, tableName: "DeliriumLocalizable", bundle: Bundle.localeBundle(), comment: "")
    }
    
}
