//
//  CoreUIConstant.swift
//  CoreUI
//
//  Created by Ansyar Hafid on 03/02/24.
//

import Foundation

public enum CoreUIConstant {
    public enum Font {
        public static let black = "Poppins-Black"
        public static let blackItalic = "Poppins-BlackItalic"
        public static let bold = "Poppins-Bold"
        public static let boldItalic = "Poppins-BoldItalic"
        public static let extraBold = "Poppins-ExtraBold"
        public static let extraBoldItalic = "Poppins-ExtraBoldItalic"
        public static let extraLight = "Poppins-ExtraLight"
        public static let extraLightItalic = "Poppins-ExtraLightItalic"
        public static let italic = "Poppins-Italic"
        public static let light = "Poppins-Light"
        public static let lightItalic = "Poppins-LightItalic"
        public static let medium = "Poppins-Medium"
        public static let mediumItalic = "Poppins-MediumItalic"
        public static let regular = "Poppins-Regular"
        public static let semiBold = "Poppins-SemiBold"
        public static let semiBoldItalic = "Poppins-SemiBoldItalic"
        public static let thin = "Poppins-Thin"
        public static let thinItalic = "Poppins-ThinItalic"
    }
    
    public enum FontSize {
        public static let logo1: CGFloat = 48
        public static let logo2: CGFloat = 40
        public static let logo3: CGFloat = 32
        public static let logo4: CGFloat = 24
        public static let logo5: CGFloat = 16
        
        public static let headline0ExtraBold: CGFloat = 32
        public static let headline1ExtraBold: CGFloat = 28
        public static let headline2Bold: CGFloat = 24
        public static let headline3Bold: CGFloat = 18
        public static let headline4Bold: CGFloat = 16
        public static let headline5Bold: CGFloat = 14
        public static let headline6Bold: CGFloat = 12
        
        public static let body1: CGFloat = 16
        public static let body2: CGFloat = 14
        public static let body3: CGFloat = 12
        
        public static let label1: CGFloat = 14
        public static let label2: CGFloat = 12
        public static let label3: CGFloat = 10
        
        public static let amount1ExtraBold: CGFloat = 40
        public static let amount2ExtraBold: CGFloat = 28
        public static let amount3ExtraBold: CGFloat = 20
        
        public static let avatar1DemiBold: CGFloat = 18
        
        public static let underline1: CGFloat = 16
        public static let underline2: CGFloat = 14
        public static let underline3: CGFloat = 12
    }
    
    public enum IconName: String {
        case icHome = "ic_home"
        case icTask = "ic_task"
        case icForms = "ic_forms"
        case icTraining = "ic_training"
        case icEllipsis = "ic_ellipsis"
    }
}
