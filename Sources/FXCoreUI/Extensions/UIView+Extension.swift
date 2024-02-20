//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit
import FXCore

public extension UIView {
    func stopShimmeringAnimation() {
        DispatchQueue.main.async {
            for view in self.subviews where view.tag == 999 {
                view.removeFromSuperview()
            }
        }
    }
    
    func hideShimmeringAnimation() {
        for view in self.subviews where view.tag == 999 {
            view.removeFromSuperview()
        }
    }
    
    func addSpinnerLoaderView(completion: (() -> Void)? = nil) {
        removeSpinnerLoaderView()
        DispatchQueue.main.async {
            let spinnerView = LottieSpinner(attachTo: self)
            spinnerView.fadeIn(animationCompletion: {
                completion?()
            })
        }
    }
    
    func removeSpinnerLoaderView() {
        DispatchQueue.main.async {
            for subview in self.subviews {
                if let subview = subview as? LottieSpinner {
                    subview.fadeOut(animationCompletion: {
                        subview.dismiss()
                    })
                }
            }
        }
    }
    
    var showingSpinnerLoaderView: Bool {
        return subviews.first(where: { $0 is LottieSpinner }) != nil
    }
    
    func fadeIn(completion: (() -> Void)? = nil, animationCompletion: (() -> Void)? = nil) {
        alpha = .zero
        isHidden = false
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self else { return }
            self.alpha = 1.0
        }, completion: { (_) in
            animationCompletion?()
            completion?()
        })
    }
    
    func fadeOut(completion: (() -> Void)? = nil, animationCompletion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self else { return }
            self.alpha = .zero
        }, completion: { (_) in
            self.isHidden = true
            animationCompletion?()
            completion?()
        })
    }
    
    func loadNib() -> UIView {
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else { return UIView() }
        let nib = UINib(nibName: nibName, bundle: .classBundle(for: classForCoder))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
    }
    
    func cornerRadius(_ radius: CGFloat, cornerType: CACornerMask = .allCorners) {
        layer.cornerRadius = radius
        layer.maskedCorners = cornerType
        clipsToBounds = true
    }
    
    func addBorderLine(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping Closure) {
        let sleeve = ClosureSleeve(closure)
        let gesture = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
        gesture.numberOfTapsRequired = .one
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
        objc_setAssociatedObject(self, String(format: "[%d]", Int.random(in: 0..<Int.max)), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
