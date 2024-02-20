//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit

public extension CACornerMask {
    static let allTop: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    static let allBottom: CACornerMask = [.layerMinXMaxYCorner, layerMaxXMaxYCorner]
    static let allLeft: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    static let allRight: CACornerMask = [.layerMaxXMinYCorner, layerMaxXMaxYCorner]
    static let allCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
}
