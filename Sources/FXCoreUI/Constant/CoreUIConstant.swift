//
//  CoreUIConstant.swift
//  CoreUI
//
//  Created by Ansyar Hafid on 03/02/24.
//

import Foundation

public enum CoreUIConstant {
    public enum IconName: String {
        case icHome = "ic_home"
        case icTask = "ic_task"
        case icForms = "ic_forms"
        case icTraining = "ic_training"
        case icEllipsis = "ic_ellipsis"
    }
    
    public enum ViewTags {
        public static let overlayTag: Int = 749
    }
    
    enum UISizing: CGFloat {
        case xsmall = 4
        case small = 8
        case medium = 16
        case large = 32
        case xlarge = 40
        case xxlarge = 48
        case xxxlarge = 56
    }
    
    enum UISpacing: CGFloat {
        case four = 4
        case eight = 8
        case twelve = 12
        case sixteen = 16
        case twenty = 20
        case twentyFour = 24
        case twentyEight = 28
        case thirtyTwo = 32
        case thirtySix = 36
        case fourty = 40
        case fourtyFour = 44
        case fourtyEight = 48
        case fiftyTwo = 52
    }
    
    enum UIAlpha: CGFloat {
        case pointOne = 0.1
        case pointThree = 0.3
        case pointFive = 0.5
        case pointEight = 0.8
    }
}
