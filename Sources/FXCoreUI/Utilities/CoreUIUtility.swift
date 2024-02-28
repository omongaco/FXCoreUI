//
//  CoreUIUtility.swift
//  CoreUI
//
//  Created by Ansyar Hafid on 03/02/24.
//

import UIKit

public class CoreUIUtility: NSObject {
    public static func registerFonts() {
        let bundle: Bundle = Bundle.module
        guard let fontUrl = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil) else { return }
        fontUrl.forEach { url in
            var error: Unmanaged<CFError>?
            guard let provider = CGDataProvider(url: url as CFURL),
                  let font = CGFont(provider),
                  CTFontManagerRegisterGraphicsFont(font, &error)
            else {
                print("### Error registering font: \(error!.takeUnretainedValue())")
                return
            }
        }
    }
    
    public static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .compactMap { $0.windows.first { $0.isKeyWindow } }
                .first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
