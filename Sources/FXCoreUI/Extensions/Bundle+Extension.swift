//
//  Bundle+Extension.swift
//
//
//  Created by Ansyar Hafid on 07/02/24.
//

import Foundation

public extension Bundle {
    // Function to get the bundle for a specific class
    static func classBundle(for class: AnyClass) -> Bundle {
        return Bundle(for: `class`.self)
    }
    
    // Computed property to get the module bundle
    static var moduleBundle: Bundle = {
        let bundleName = "FXCoreUI"
        
        // Candidates for the bundle URL
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BaseViewController.self).resourceURL,
            Bundle.main.bundleURL,
            // This is an important addition for SPM
            Bundle.module.resourceURL
        ]
        
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        // Fallback: Trying to find the bundle within the module itself (SPM case)
        if let bundle = Bundle.module.url(forResource: bundleName, withExtension: "bundle").flatMap(Bundle.init(url:)) {
            return bundle
        }
        
        fatalError("unable to find bundle named \(bundleName)")
    }()
}
