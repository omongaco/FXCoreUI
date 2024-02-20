//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 20/02/24.
//

import UIKit
import Combine

private var associatedObjectHandle: UInt8 = 0

public extension UIBarButtonItem {
    private var tapPublisher: PassthroughSubject<Void, Never> {
        if let publisher = objc_getAssociatedObject(self, &associatedObjectHandle) as? PassthroughSubject<Void, Never> {
            return publisher
        } else {
            let publisher = PassthroughSubject<Void, Never>()
            objc_setAssociatedObject(self, &associatedObjectHandle, publisher, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.target = self
            self.action = #selector(barButtonItemTapped)
            return publisher
        }
    }
    
    func publisher() -> AnyPublisher<Void, Never> {
        return tapPublisher.eraseToAnyPublisher()
    }
    
    @objc private func barButtonItemTapped() {
        tapPublisher.send()
    }
}
