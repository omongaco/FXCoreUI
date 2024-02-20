//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 20/02/24.
//

import UIKit
import Combine

public extension UIDatePicker {
    private struct AssociatedKeys {
        static var datePublisher = "datePublisher"
    }
    
    var datePublisher: CurrentValueSubject<Date, Never> {
        if let publisher = objc_getAssociatedObject(self, &AssociatedKeys.datePublisher) as? CurrentValueSubject<Date, Never> {
            return publisher
        } else {
            let publisher = CurrentValueSubject<Date, Never>(self.date)
            objc_setAssociatedObject(self, &AssociatedKeys.datePublisher, publisher, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            self.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
            return publisher
        }
    }
    
    @objc private func dateChanged() {
        datePublisher.send(self.date)
    }
}
