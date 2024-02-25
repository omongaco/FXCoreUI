//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit
import Combine

// Extension to provide a generic publisher for UITextField events
public extension UITextField {
    func publisher(for events: [Notification.Name]) -> AnyPublisher<(Notification.Name, String?), Never> {
        let publishers = events.map { event in
            NotificationCenter.default.publisher(for: event, object: self)
                .map { _ in (event, self.text) }
        }
        return Publishers.MergeMany(publishers).eraseToAnyPublisher()
    }
    
    func setPLaceholderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
    func setCustomPlaceholder(font: UIFont, color: UIColor) {
        guard let placeholder = placeholder, !placeholder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: color,
            .font: font,
            .kern: 0.5
        ])
    }
    
    func setMaxLength(_ length: Int) {
        addTarget(self, action: #selector(limitLength), for: .editingChanged)
        objc_setAssociatedObject(self, "length_limit", length, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc private func limitLength() {
        guard let length = objc_getAssociatedObject(self, "length_limit") as? Int else { return }
        if let text = text, text.count > length {
            let index = text.index(text.startIndex, offsetBy: length)
            self.text = String(text[..<index])
        }
    }
}
