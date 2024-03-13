//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 13/03/24.
//

import UIKit

public class FontManager {
    public static func registerFonts() {
        let bundle: Bundle = Bundle.module
        guard let fontUrls = bundle.urls(forResourcesWithExtension: "ttf", subdirectory: nil) else { return }
        fontUrls.forEach { url in
            var error: Unmanaged<CFError>?
            guard let provider = CGDataProvider(url: url as CFURL),
                  let font = CGFont(provider),
                  CTFontManagerRegisterGraphicsFont(font, &error)
            else {
                print("### Error registering font \(error!.takeUnretainedValue())")
                return
            }
        }
    }
}
