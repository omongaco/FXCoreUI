//
//  CoreUIConstant.swift
//  CoreUI
//
//  Created by Ansyar Hafid on 03/02/24.
//

import Foundation

public enum CoreUIConstant {
    public enum Font {
        public static let interBlack = "Inter-Black"
        public static let interBold = "Inter-Bold"
        public static let interExtraBold = "Inter-ExtraBold"
        public static let interExtraLight = "Inter-ExtraLight"
        public static let interLight = "Inter-Light"
        public static let interMedium = "Inter-Medium"
        public static let interRegular = "Inter-Regular"
        public static let interSemiBold = "Inter-SemiBold"
        public static let interThin = "Inter-Thin"
    }
    
    public enum FontSize {
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
