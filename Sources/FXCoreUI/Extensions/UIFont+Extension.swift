//
//  UIFont+Extension.swift
//  CoreUI
//
//  Created by Ansyar Hafid on 03/02/24.
//

import UIKit.UIFont

public extension UIFont {
    static let headline0ExtraBold: UIFont = UIFont(
        name: CoreUIConstant.Font.extraBold,
        size: CoreUIConstant.FontSize.headline0ExtraBold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline0ExtraBold)
    static let headline1ExtraBold: UIFont = UIFont(
        name: CoreUIConstant.Font.extraBold,
        size: CoreUIConstant.FontSize.headline1ExtraBold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline1ExtraBold)
    static let headline2Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.headline2Bold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline2Bold)
    static let headline3Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.headline3Bold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline3Bold)
    static let headline4Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.headline4Bold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline4Bold)
    static let headline5Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.headline5Bold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline5Bold)
    static let headline6Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.headline6Bold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.headline6Bold)
}

// MARK: - New Paragraphs
public extension UIFont {
    static let body1DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.body1
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.body1)
    static let body1Regular: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.body1
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.body1)
    static let body2DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.body2
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.body2)
    static let body2Regular: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.body2
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.body2)
    static let body3DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.body3
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.body3)
    static let body3Regular: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.body3
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.body3)
}

// MARK: - New Caption
public extension UIFont {
    static let label1DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.label1
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.label1)
    static let label1Regular: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.label1
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.label1)
    static let label2DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.label2
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.label2)
    static let label2Regular: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.label2
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.label2)
    static let label3DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.label3
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.label3)
    static let label3Regular: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.label3
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.label3)
}

// MARK: - New Amount
public extension UIFont {
    static let amount1ExtraBold: UIFont = UIFont(
        name: CoreUIConstant.Font.extraBold,
        size: CoreUIConstant.FontSize.amount1ExtraBold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.amount1ExtraBold)
    static let amount2ExtraBold: UIFont = UIFont(
        name: CoreUIConstant.Font.extraBold,
        size: CoreUIConstant.FontSize.amount2ExtraBold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.amount2ExtraBold)
    static let amount3ExtraBold: UIFont = UIFont(
        name: CoreUIConstant.Font.extraBold,
        size: CoreUIConstant.FontSize.amount3ExtraBold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.amount3ExtraBold)
}

// MARK: - New Avatar
public extension UIFont {
    static let avatar1DemiBold: UIFont = UIFont(
        name: CoreUIConstant.Font.semiBold,
        size: CoreUIConstant.FontSize.avatar1DemiBold
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.avatar1DemiBold)
}

// MARK: - New Underline
public extension UIFont {
    static let underline1Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.underline1
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.underline1)
    static let underline1Medium: UIFont = UIFont(
        name: CoreUIConstant.Font.medium,
        size: CoreUIConstant.FontSize.underline1
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.underline1)
    static let underline2Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.underline2
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.underline2)
    static let underline2Medium: UIFont = UIFont(
        name: CoreUIConstant.Font.medium,
        size: CoreUIConstant.FontSize.underline2
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.underline2)
    static let underline3Bold: UIFont = UIFont(
        name: CoreUIConstant.Font.bold,
        size: CoreUIConstant.FontSize.underline3
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.underline3)
    static let underline3Medium: UIFont = UIFont(
        name: CoreUIConstant.Font.medium,
        size: CoreUIConstant.FontSize.underline3
    ) ?? .systemFont(ofSize: CoreUIConstant.FontSize.underline3)
}

// MARK: - Logo
public extension UIFont {
    static let logo1: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.logo1) ?? .systemFont(ofSize: CoreUIConstant.FontSize.logo1)
    static let logo2: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.logo2) ?? .systemFont(ofSize: CoreUIConstant.FontSize.logo2)
    static let logo3: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.logo3) ?? .systemFont(ofSize: CoreUIConstant.FontSize.logo3)
    static let logo4: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.logo4) ?? .systemFont(ofSize: CoreUIConstant.FontSize.logo4)
    static let logo5: UIFont = UIFont(
        name: CoreUIConstant.Font.regular,
        size: CoreUIConstant.FontSize.logo5) ?? .systemFont(ofSize: CoreUIConstant.FontSize.logo5)
}
