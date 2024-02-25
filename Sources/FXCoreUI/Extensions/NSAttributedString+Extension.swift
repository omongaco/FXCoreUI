//
//  NSAttributedString+Extension.swift
//  
//
//  Created by Ansyar Hafid on 06/02/24.
//

import UIKit

public extension NSAttributedString {
    private static func generateAttribute(
        text: String,
        font: UIFont,
        lineHeightMultiplier: CGFloat,
        alignment: NSTextAlignment,
        additionalAttribute: [NSAttributedString.Key: Any]?,
        additionalRange: NSRange? = nil,
        isImageNSAttachment: Bool = false,
        isUnderline: Bool = false
    ) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.minimumLineHeight = lineHeightMultiplier * font.pointSize
        paragraphStyle.maximumLineHeight = lineHeightMultiplier * font.pointSize
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let attributedString = NSMutableAttributedString(string: text)
        let range = NSRange(location: .zero, length: attributedString.length)
        let baseAttribute: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: font,
            .kern: 0.2
        ]
        attributedString.addAttributes(baseAttribute, range: range)
        if isUnderline {
            attributedString.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue], range: range)
        }
        if let additionalAttribute {
            attributedString.addAttributes(additionalAttribute, range: additionalRange ?? range)
        }
        return attributedString
    }
}

public extension NSAttributedString {
    static func headline0ExtraBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline0ExtraBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func headline1ExtraBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline1ExtraBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func headline2Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil,
        isImageNSAttachment: Bool = false
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline2Bold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isImageNSAttachment: isImageNSAttachment
        )
    }
    
    static func headline3Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline3Bold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func headline4Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline4Bold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func headline5Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline5Bold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func headline6Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .headline6Bold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
}

// MARK: - New Paragraphs
public extension NSAttributedString {
    static func body1DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .body1DemiBold,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func body1Regular(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .body1Regular,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func body2DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .body2DemiBold,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func body2Regular(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .body2Regular,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func body3DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .body3DemiBold,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func body3Regular(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .body3Regular,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
}

// MARK: - New Label
public extension NSAttributedString {
    static func label1DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .label1DemiBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func label1Regular(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .label1Regular,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func label2DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .label2DemiBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func label2Regular(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .label2Regular,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func label3DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .label3DemiBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func label3Regular(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .label3Regular,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
}

// MARK: - New Amount
public extension NSAttributedString {
    static func amount1ExtraBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .amount1ExtraBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func amount2ExtraBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .amount2ExtraBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
    
    static func amount3ExtraBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .amount3ExtraBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
}

// MARK: - New Avatar
public extension NSAttributedString {
    static func avatar1DemiBold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .avatar1DemiBold,
            lineHeightMultiplier: 1.2,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange
        )
    }
}

// MARK: - Underline
public extension NSAttributedString {
    static func underline1Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .underline1Bold,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func underline1Medium(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .underline1Medium,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func underline2Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .underline2Bold,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func underline2Medium(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .underline2Medium,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func underline3Bold(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .underline3Bold,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func underline3Medium(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .underline3Medium,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
}

// MARK: - Logo
public extension NSAttributedString {
    static func logo1(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .logo1,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func logo2(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .logo2,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func logo3(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .logo3,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func logo4(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .logo4,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
    
    static func logo5(
        _ text: String,
        alignment: NSTextAlignment = .left,
        additionalAttribute: [NSAttributedString.Key: Any]? = nil,
        additionalRange: NSRange? = nil
    ) -> NSAttributedString {
        generateAttribute(
            text: text,
            font: .logo5,
            lineHeightMultiplier: 1.4,
            alignment: alignment,
            additionalAttribute: additionalAttribute,
            additionalRange: additionalRange,
            isUnderline: true
        )
    }
}

// MARK: NSMutableAttributedString
public extension NSMutableAttributedString {
    func replaceAttributedString(from : String, to : NSAttributedString) {
        if let startRange = self.string.range(of: from) {
            let nsStartRange = NSRange(startRange, in: self.string)
            self.replaceCharacters(in: nsStartRange, with: to)
        }
    }
}

// MARK: NSAttributedString
public extension NSAttributedString {
    func height(containerWidth: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: containerWidth, height: CGFloat.greatestFiniteMagnitude),
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     context: nil)
        return ceil(rect.size.height)
    }
}
