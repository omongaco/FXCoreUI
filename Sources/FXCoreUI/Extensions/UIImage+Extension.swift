//
//  UIImage+Extension.swift
//  CoreUI
//
//  Created by Ansyar Hafid on 05/02/24.
//

import UIKit

public extension UIImage {
    static func frameworkImage(named name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle.module, compatibleWith: nil)
    }
    
    static func frameworkImageWithConfig(named name: String, config: SymbolConfiguration) -> UIImage? {
        return UIImage(named: name, in: Bundle.module, with: config)
    }
}
