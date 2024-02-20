//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit
import Combine

public extension UIButton {
    func tapPublisher() -> AnyPublisher<Void, Never> {
        controlEventPublisher(for: .touchUpInside)
    }

    private func controlEventPublisher(for controlEvents: UIControl.Event) -> AnyPublisher<Void, Never> {
        Deferred {
            Future { [weak self] promise in
                if #available(iOS 14.0, *) {
                    let action = UIAction { _ in promise(.success(())) }
                    self?.addAction(action, for: controlEvents)
                } else {
                    // Fallback on earlier versions
                    let target = EventTarget(handler: { promise(.success(())) })
                    self?.addTarget(target, action: #selector(EventTarget.invokeActionHandler), for: controlEvents)
                    // Associate the target object with the button to ensure it is retained
                    objc_setAssociatedObject(self, UUID().uuidString, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

private class EventTarget: NSObject {
    var handler: () -> Void

    init(handler: @escaping () -> Void) {
        self.handler = handler
    }

    @objc func invokeActionHandler() {
        self.handler()
    }
}
