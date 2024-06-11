//
//  Bundle+Extension.swift
//
//
//  Created by Ansyar Hafid on 07/02/24.
//

import Foundation

public extension Bundle {
    static func classBundle(for class: AnyClass) -> Bundle {
        return Bundle(for: `class`.self)
    }
    
    static var moduleBundle: Bundle = {
        let bundleName = "FXCoreUI"
        
        // Add debug logging
        print("Searching for bundle named \(bundleName)")
        
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BaseViewController.self).resourceURL,
            Bundle.main.bundleURL,
            Bundle.module.resourceURL // This is specific for SPM
        ]
        
        for candidate in candidates {
            if let candidate = candidate {
                let bundlePath = candidate.appendingPathComponent(bundleName + ".bundle")
                print("Checking path: \(bundlePath)")
                
                if let bundle = Bundle(url: bundlePath) {
                    print("Found bundle at \(bundlePath)")
                    return bundle
                }
            }
        }
        
        // Fallback: Trying to find the bundle within the module itself (SPM case)
        if let bundleURL = Bundle.module.url(forResource: bundleName, withExtension: "bundle") {
            print("Checking module URL: \(bundleURL)")
            
            if let bundle = Bundle(url: bundleURL) {
                print("Found bundle at module URL: \(bundleURL)")
                return bundle
            }
        }
        
        fatalError("unable to find bundle named \(bundleName)")
    }()
}
