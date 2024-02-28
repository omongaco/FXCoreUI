//
//  FXButtonDependency.swift
//
//
//  Created by Ansyar Hafid on 27/02/24.
//

import UIKit
import FXCore

public struct FXButtonConfigs {
    var rightImage: UIImage?
    var leftImage: UIImage?
    var title: String
    var style: ButtonStyle
    var size: ButtonSize

    public init(
        rightImage: UIImage? = nil,
        leftImage: UIImage? = nil,
        title: String = .emptyString,
        style: ButtonStyle = .primary,
        size: ButtonSize = .large
    ) {
        self.rightImage = rightImage
        self.leftImage = leftImage
        self.title = title
        self.style = style
        self.size = size
    }
}
