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
        
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BaseViewController.self).resourceURL,
            Bundle.main.bundleURL,
            Bundle.module.resourceURL // This is specific for SPM
        ]
        
        for candidate in candidates {
            if let candidatePath = candidate {
                if let bundle = Bundle(url: candidatePath) {
                    print("Found bundle at \(candidatePath)")
                    return bundle
                }
            }
        }
        
        fatalError("unable to find bundle named \(bundleName)")
    }()
}
