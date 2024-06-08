//
//  LottieSpinner.swift
//
//
//  Created by Ansyar Hafid on 07/02/24.
//

import UIKit
import Lottie

class LottieSpinner: UIView {
    private let spinnerSize: CGFloat = 72
    private let spinnerContainerSize: CGFloat = 96
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = spinnerContainerSize / 2
        return view
    }()
    
    private let spinnerView: LottieAnimationView = {
        let lottieView = LottieAnimationView()
        let fullscreenSpinnerAnimation = LottieAnimation.named(
            "multi-shape-loader",
            bundle: Bundle.moduleBundle)
        lottieView.animation = fullscreenSpinnerAnimation
        lottieView.loopMode = .loop
        return lottieView
    }()

    init(attachTo parent: UIView) {
        super.init(frame: parent.frame)
        componentSetup()
        attachWithAnimation(to: parent)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func componentSetup() {
        containerView.addSubview(spinnerView)
        addSubview(containerView)
        setupConstraints()
        containerView.layer.zPosition = self.layer.zPosition + 2
        
        startAnimating()
    }
    
    func dismiss() {
        DispatchQueue.main.async {[weak self] in
            if let parent = self?.superview {
                UIView.transition(with: parent, duration: 0.3, options: .transitionCrossDissolve) {[weak self] in
                    guard let self else { return }
                    removeFromSuperview()
                }
            }
        }
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinnerView.heightAnchor.constraint(equalToConstant: spinnerSize),
            spinnerView.widthAnchor.constraint(equalTo: spinnerView.heightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: spinnerContainerSize),
            containerView.widthAnchor.constraint(equalTo: containerView.heightAnchor),
            
            spinnerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func attachWithAnimation(to parent: UIView) {
        UIView.transition(with: parent, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
            guard let self else { return }
            parent.addSubview(self)
            setFullScreen()
        }
    }
    
    private func setFullScreen() {
        guard let parent = superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parent.topAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor)
        ])
    }
    
    private func startAnimating() {
        spinnerView.play()
    }
}
