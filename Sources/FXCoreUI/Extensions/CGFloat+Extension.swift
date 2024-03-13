//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit

public extension CGFloat {
    static let deviceWidth  = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    
    static func getTextWidth(_ text: String,
                                    height: CGFloat,
                                    font: UIFont,
                                    line: Int = 1) -> CGFloat {
        guard !text.isEmpty else {
            return 0.0
        }
        
        let label: UILabel = {
            let lbl = UILabel()
            lbl.frame = CGRect(x: 0.0, y: 0.0, width: .greatestFiniteMagnitude, height: height)
            lbl.font = font
            lbl.textAlignment = .left
            lbl.numberOfLines = line
            lbl.lineBreakMode = .byWordWrapping
            lbl.text = text
            lbl.sizeToFit()
            return lbl
        }()
        
        return label.frame.width + 1
    }
}
