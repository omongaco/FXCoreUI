//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit

public enum ModalPosition {
    case topLeft, topRight, bottomLeft, bottomRight
}

public enum ShowAnimationType {
    case slide, fade, pop
}

public class ModalView: UIView {
    
    private var position: ModalPosition = .topRight
    private var animationType: ShowAnimationType = .slide
    private var contentView: UIView?
    private var withinSafeArea: Bool = true
    private var startPositionOffset: CGPoint = .zero

    public init(position: ModalPosition,
                animationType: ShowAnimationType,
                withinSafeArea: Bool = true,
                startPositionOffset: CGPoint = .zero,
                contentView: UIView? = nil) {
        self.position = position
        self.animationType = animationType
        self.contentView = contentView
        self.withinSafeArea = withinSafeArea
        self.startPositionOffset = startPositionOffset
        super.init(frame: .zero)
        
        if let contentView = contentView {
            attachContentView(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        configureShadowAndCornerRadius()
    }
    
    private func configureShadowAndCornerRadius() {
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        // Custom shadow path to avoid shadow on the top
        let shadowPath = UIBezierPath()
        let shadowWidth: CGFloat = 4
        shadowPath.move(to: CGPoint(x: -shadowWidth, y: layer.cornerRadius))
        shadowPath.addLine(to: CGPoint(x: -shadowWidth, y: bounds.height + shadowWidth))
        shadowPath.addLine(to: CGPoint(x: bounds.width + shadowWidth, y: bounds.height + shadowWidth))
        shadowPath.addLine(to: CGPoint(x: bounds.width + shadowWidth, y: layer.cornerRadius))
        shadowPath.addArc(withCenter: CGPoint(x: bounds.width - layer.cornerRadius, y: layer.cornerRadius), radius: layer.cornerRadius, startAngle: 0, endAngle: CGFloat(Double.pi/2), clockwise: false)
        shadowPath.addLine(to: CGPoint(x: layer.cornerRadius, y: 0))
        shadowPath.addArc(withCenter: CGPoint(x: layer.cornerRadius, y: layer.cornerRadius), radius: layer.cornerRadius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: false)
        shadowPath.close()

        layer.shadowPath = shadowPath.cgPath

        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = false
    }
    
    func attachContentView(_ view: UIView) {
        if let contentView = contentView {
            contentView.removeFromSuperview()
        }
        contentView = view
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        resizeToFitContentView()
    }
    
    private func resizeToFitContentView() {
        guard let contentView = contentView else { return }
        let targetSize = contentView.intrinsicContentSize != UIView.layoutFittingCompressedSize ? contentView.intrinsicContentSize : contentView.frame.size
        frame.size = CGSize(width: max(targetSize.width, frame.size.width),
                            height: max(targetSize.height, frame.size.height))
        if let parentView = superview {
            frame = calculateFrame(in: parentView)
        }
    }
    
    public func show(in parentView: UIView) {
        frame = calculateFrame(in: parentView)
        switch animationType {
            case .slide:
                slideInAnimation(parentView: parentView)
            case .fade:
                fadeInAnimation(parentView: parentView)
            case .pop:
                popInAnimation(parentView: parentView)
        }
    }
    
    private func calculateFrame(in parentView: UIView) -> CGRect {
        var size = contentView?.frame.size ?? CGSize(width: 200, height: 300)

        size.width = min(size.width, parentView.bounds.width)
        size.height = min(size.height, parentView.bounds.height)
        
        let safeAreaInsets = withinSafeArea ? parentView.safeAreaInsets : UIEdgeInsets.zero
        let padding: CGFloat = 16.0
        
        var origin: CGPoint = .zero
        
        switch position {
        case .topLeft:
            origin = CGPoint(x: safeAreaInsets.left + startPositionOffset.x + padding,
                             y: safeAreaInsets.top + startPositionOffset.y + padding)
        case .topRight:
            origin = CGPoint(x: parentView.bounds.width - size.width - safeAreaInsets.right - startPositionOffset.x - padding,
                             y: safeAreaInsets.top + startPositionOffset.y + padding)
        case .bottomLeft:
            origin = CGPoint(x: safeAreaInsets.left + startPositionOffset.x + padding,
                             y: parentView.bounds.height - size.height - safeAreaInsets.bottom - startPositionOffset.y - padding)
        case .bottomRight:
            origin = CGPoint(x: parentView.bounds.width - size.width - safeAreaInsets.right - startPositionOffset.x - padding,
                             y: parentView.bounds.height - size.height - safeAreaInsets.bottom - startPositionOffset.y - padding)
        }
        
        return CGRect(origin: origin, size: size)
    }


    
    private func slideInAnimation(parentView: UIView) {
        parentView.addSubview(self)
        transform = CGAffineTransform(translationX: 0, y: -parentView.bounds.height)
        UIView.animate(withDuration: 0.3) {
            self.transform = .identity
        }
    }
    
    private func fadeInAnimation(parentView: UIView) {
        parentView.addSubview(self)
        alpha = 0.0
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1.0
        }
    }
    
    private func popInAnimation(parentView: UIView) {
        parentView.addSubview(self)
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.3) {
            self.transform = .identity
        }
    }
}

