//
//  ViewModal.swift
//  Formuleer
//
//  Created by Ansyar Hafid on 24/01/24.
//  Copyright © 2024 Ansyar Hafid. All rights reserved.
//

import UIKit

public struct ModalGeneralErrorProperties {
    public let title: String?
    public let titleIcon: UIImage?
    public let body: String?
    public let primaryButtonText: String?
    public let secondaryButtonText: String?
    public var isShowCloseButton: Bool = false

    public init(
        title: String? = nil,
        titleIcon: UIImage? = nil,
        body: String? = nil,
        primaryButtonText: String? = nil,
        secondaryButtonText: String? = nil,
        isShowCloseButton: Bool = false
    ) {
        self.title = title
        self.titleIcon = titleIcon
        self.body = body
        self.primaryButtonText = primaryButtonText
        self.secondaryButtonText = secondaryButtonText
        self.isShowCloseButton = isShowCloseButton
    }
}

public struct ModalGeneralConfigProperties {
    public var topTitle: String?
    public var topTitleIcon: UIImage?
    public var title: String?
    public var subTitle: String?
    public var titleIcon: UIImage?
    public var description: String?
    public var body: String?
    public var primaryButtonText: String?
    public var primaryButtonLeftImage: UIImage?
    public var primaryButtonRightImage: UIImage?
    public var secondaryButtonText: String?
    public var secondaryButtonLeftImage: UIImage?
    public var secondaryButtonRightImage: UIImage?
    public var tertiaryButtonText: String?
    public var tertiaryButtonLeftImage: UIImage?
    public var tertiaryButtonRightImage: UIImage?
    public var withCloseButton: Bool
    public var image: UIImage?
    
    // Used for closure action
    public var onTapPrimaryButton: (() -> Void)?
    public var onTapSecondaryButton: (() -> Void)?
    public var onTapTertiaryButton: (() -> Void)?
    public var onTapCloseButton: (() -> Void)?

    public init(
        topTitle: String? = nil,
        topTitleIcon: UIImage? = nil,
        title: String? = nil,
        titleIcon: UIImage? = nil,
        description: String? = nil,
        image: UIImage? = nil,
        body: String? = nil,
        primaryButtonText: String? = nil,
        primaryButtonLeftImage: UIImage? = nil,
        primaryButtonRightImage: UIImage? = nil,
        secondaryButtonText: String? = nil,
        secondaryButtonLeftImage: UIImage? = nil,
        secondaryButtonRightImage: UIImage? = nil,
        tertiaryButtonText: String? = nil,
        tertiaryButtonLeftImage: UIImage? = nil,
        tertiaryButtonRightImage: UIImage? = nil,
        withCloseButton: Bool = false,
        primaryButtonAction: (() -> Void)? = nil,
        secondaryButtonAction: (() -> Void)? = nil,
        tertinaryButtonAction: (() -> Void)? = nil,
        closeButtonAction: (() -> Void)? = nil
    ) {
        self.topTitle = topTitle
        self.topTitleIcon = topTitleIcon
        self.title = title
        self.titleIcon = titleIcon
        self.description = description
        self.image = image
        self.body = body
        self.primaryButtonText = primaryButtonText
        self.primaryButtonLeftImage = primaryButtonLeftImage
        self.primaryButtonRightImage = primaryButtonRightImage
        self.secondaryButtonText = secondaryButtonText
        self.secondaryButtonLeftImage = secondaryButtonLeftImage
        self.secondaryButtonRightImage = secondaryButtonRightImage
        self.tertiaryButtonText = tertiaryButtonText
        self.tertiaryButtonLeftImage = tertiaryButtonLeftImage
        self.tertiaryButtonRightImage = tertiaryButtonRightImage
        self.withCloseButton = withCloseButton
        self.onTapPrimaryButton = primaryButtonAction
        self.onTapSecondaryButton = secondaryButtonAction
        self.onTapTertiaryButton = tertinaryButtonAction
        self.onTapCloseButton = closeButtonAction
    }
}

public class ModalView: UIView {
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var modalContainer: UIView!
    @IBOutlet weak var modalStackView: UIStackView!
    
    @IBOutlet weak var closeContainer: UIStackView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var modalTitle: UILabel!
    
    @IBOutlet weak var mainImageContainer: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var topTitleContainer: UIStackView!
    @IBOutlet weak var topTitleImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var subBodyLabel: UILabel!
    
    @IBOutlet public weak var bottomTitleContainer: UIStackView!
    @IBOutlet public weak var bottomTitleImageView: UIImageView!
    @IBOutlet public weak var bottomTitleLabel: UILabel!
    @IBOutlet public weak var bottomSubTitleLabel: UILabel!
    @IBOutlet public weak var descriptionLabelContainer: UIView!
    @IBOutlet public weak var descriptionLabel: UILabel!
    @IBOutlet public weak var primaryButton: UIButton!
    @IBOutlet public weak var secondaryButton: UIButton!
    @IBOutlet public weak var tertiaryButton: UIButton!
    
    @IBOutlet public weak var contentStack: UIStackView!
    @IBOutlet public weak var buttonStack: UIStackView!
    
    public var onTapPrimaryButton: (() -> Void)?
    public var onTapSecondaryButton: (() -> Void)?
    public var onTapTertiaryButton: (() -> Void)?
    public var onTapCloseButton: (() -> Void)?
    
    let animationUp = 0.4
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadFunctions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFunctions()
    }
    
    @IBAction func buttonsTapActions(_ sender: UIButton) {
        switch sender {
        case closeButton:
            onTapCloseButton?()
        case primaryButton:
            onTapPrimaryButton?()
        case secondaryButton:
            onTapSecondaryButton?()
        case tertiaryButton:
            onTapTertiaryButton?()
        default:
            break
        }
        
        dismissModal()
    }
    
    func loadFunctions() {
        initialSetup()
        configureViews()
        configurePrimaryButton()
        configureSecondaryButton()
        configureTertiaryButton()
    }
    
    private func initialSetup() {
        let view = loadNib()
        addSubview(view)
        view.frame = bounds
        view.backgroundColor = .clear
        tag = CoreUIConstant.ViewTags.overlayTag
    }
}

extension ModalView {
    private func configureViews() {
        // Gray Area
        grayView.backgroundColor = .FlexColor.overlay
        grayView.alpha = .zero
        // Modal Title
        modalTitle.font = .headline3Bold
        // Close Button
        modalStackView.setCustomSpacing(CoreUIConstant.UISizing.small.rawValue, after: closeContainer)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        // Modal Container
        modalContainer.backgroundColor = .FlexColor.white
        modalContainer.cornerRadius(CoreUIConstant.UISizing.small.rawValue, cornerType: .allTop)
        modalContainer.isHidden = true
        descriptionLabelContainer.isHidden = true
    }
    
    private func configurePrimaryButton() {
        primaryButton.backgroundColor = .FlexColor.black
        primaryButton.cornerRadius(primaryButton.frame.height / Int.two.toCGFloat())
        primaryButton.setTitleColor(.FlexColor.snowWhite, for: .normal)
    }
    
    private func configureSecondaryButton() {
        secondaryButton.backgroundColor = .FlexColor.white
        secondaryButton.addBorderLine(width: Int.one.toCGFloat(), color: .FlexColor.graniteGray)
        secondaryButton.cornerRadius(primaryButton.frame.height / Int.two.toCGFloat())
        secondaryButton.setTitleColor(.FlexColor.black, for: .normal)
    }
    
    private func configureTertiaryButton() {
        tertiaryButton.backgroundColor = .clear
        tertiaryButton.setTitleColor(.FlexColor.orange300, for: .normal)
    }
    
    public func setInitialPosition() {
        grayView.alpha = .zero
        let yPosition: CGFloat = .deviceHeight - modalContainer.frame.height - CoreUIConstant.UISpacing.twentyFour.rawValue
        modalContainer.transform = CGAffineTransform(translationX: .zero, y: yPosition)
        modalContainer.isHidden = false
    }
    
    public func predefinedGeneralError(title: String,
                                titleIcon: UIImage?,
                                body: String,
                                primaryButtonText: String?,
                                secondaryButtonText: String?,
                                isShowCloseButton: Bool) {
        closeContainer.isHidden = !isShowCloseButton
        mainImageContainer.isHidden = true
        bottomTitleContainer.isHidden = true
        secondaryButton.isHidden = true
        tertiaryButton.isHidden = true
        descriptionLabel.isHidden = true
        if let titleIcon {
            topTitleImageView.image = titleIcon
        } else {
            topTitleImageView.image = UIImage(systemName: "exclamationmark.triangle")?.withTintColor(.FlexColor.error3)
        }
        topTitleLabel.attributedText = .headline3Bold(title)
        bodyLabel.attributedText = .body2Regular(body)

        primaryButton.isHidden = primaryButtonText == nil
        primaryButton.setAttributedTitle(.label1DemiBold(primaryButtonText ?? .emptyString), for: .normal)

        secondaryButton.isHidden = secondaryButtonText == nil
        secondaryButton.setAttributedTitle(.label1DemiBold(secondaryButtonText ?? .emptyString), for: .normal)
    }
    
    public func confirmationConfig(body: String,
                            title: String,
                            subTitle: String,
                            titleIcon: UIImage?,
                            description: String,
                            primaryButtonText: String?,
                            secondaryButtonText: String?,
                            withCloseButton: Bool) {
        closeContainer.isHidden = !withCloseButton
        mainImageContainer.isHidden = true
        topTitleContainer.isHidden = true
        descriptionLabelContainer.isHidden = false
        bottomSubTitleLabel.isHidden = false
        if let titleIcon {
            bottomTitleImageView.isHidden = false
            bottomTitleImageView.image = titleIcon
        } else {
            bottomTitleImageView.isHidden = true
        }
        bodyLabel.attributedText = .headline3Bold(body)
        bottomTitleLabel.attributedText = .body3DemiBold(title)
        bottomSubTitleLabel.attributedText = .body1DemiBold(subTitle)
        descriptionLabel.attributedText = .body2Regular(description)
        
        if let primaryButtonText {
            primaryButton.isHidden = false
            primaryButton.setAttributedTitle(.label1DemiBold(primaryButtonText), for: .normal)
        } else {
            primaryButton.isHidden = true
        }
        
        if let secondaryButtonText {
            secondaryButton.isHidden = false
            secondaryButton.setAttributedTitle(.label1DemiBold(secondaryButtonText), for: .normal)
        } else {
            secondaryButton.isHidden = true
        }
    }
    
    public func predefinedGeneralConfig(title: String,
                                 titleIcon: UIImage?,
                                 image: UIImage?,
                                 body: String,
                                 primaryButtonText: String?,
                                 secondaryButtonText: String?,
                                 withCloseButton: Bool) {
        closeContainer.isHidden = !withCloseButton

        bottomTitleContainer.isHidden = true
        if let titleIcon, image == nil {
            topTitleImageView.isHidden = false
            topTitleImageView.image = titleIcon
        } else {
            topTitleImageView.isHidden = true
        }

        mainImageContainer.isHidden = true
        if let image, titleIcon == nil {
            mainImageContainer.isHidden = false
            mainImageView.image = image
        }

        topTitleLabel.attributedText = .headline3Bold(title)
        bodyLabel.attributedText = .body2Regular(body)
        descriptionLabel.isHidden = true

        if let primaryButtonText {
            primaryButton.isHidden = false
            primaryButton.setAttributedTitle(.label1DemiBold(primaryButtonText), for: .normal)
        } else {
            primaryButton.isHidden = true
        }
        
        if let secondaryButtonText {
            secondaryButton.isHidden = false
            secondaryButton.setAttributedTitle(.label1DemiBold(secondaryButtonText), for: .normal)
        } else {
            secondaryButton.isHidden = true
        }
    }
    
    public func closureConfig(_ properties: ModalGeneralConfigProperties) {
        closeContainer.isHidden = !properties.withCloseButton
        mainImageContainer.isHidden = true
        topTitleContainer.isHidden = true
        descriptionLabelContainer.isHidden = false
        bottomSubTitleLabel.isHidden = false
        if let titleIcon = properties.titleIcon {
            bottomTitleImageView.isHidden = false
            bottomTitleImageView.image = titleIcon
        } else {
            bottomTitleImageView.isHidden = true
        }
        bodyLabel.attributedText = .headline3Bold(properties.body ?? .emptyString)
        bottomTitleLabel.attributedText = .body3DemiBold(properties.title ?? .emptyString)
        bottomSubTitleLabel.attributedText = .body1DemiBold(properties.subTitle ?? .emptyString)
        descriptionLabel.attributedText = .body2Regular(properties.description ?? .emptyString)
        
        if let primaryButtonText = properties.primaryButtonText {
            primaryButton.isHidden = false
            primaryButton.setAttributedTitle(.label1DemiBold(primaryButtonText), for: .normal)
        } else {
            primaryButton.isHidden = true
        }
        
        if let secondaryButtonText = properties.secondaryButtonText {
            secondaryButton.isHidden = false
            secondaryButton.setAttributedTitle(.label1DemiBold(secondaryButtonText), for: .normal)
        } else {
            secondaryButton.isHidden = true
        }
        
        self.onTapPrimaryButton = properties.onTapPrimaryButton
        self.onTapSecondaryButton = properties.onTapSecondaryButton
        self.onTapTertiaryButton = properties.onTapTertiaryButton
    }
    
    public func animateShow(completion: ((Bool) -> Void)?) {
        UIView.animate(
            withDuration: animationUp,
            delay: .zero,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: .zero,
            options: .curveEaseOut,
            animations: { [weak self] in
                guard let self else { return }
                grayView.alpha = Int.one.toCGFloat()
                modalContainer.transform = .identity
            },
            completion: completion)
    }
    
    public func animateDismiss(completion: (() -> Void)?) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        guard let window = CoreUIUtility.keyWindow else { return }
        UIView.animate(
            withDuration: 0.3,
            delay: .zero,
            options: .curveLinear
        ) { [weak self] in
            guard let self else { return }
            setInitialPosition()
        } completion: { [weak self] isCompleted in
            guard let self else { return }
            if isCompleted {
                removeFromSuperview()
                if let subview = window.subviews.filter({ $0.tag == CoreUIConstant.ViewTags.overlayTag }).first {
                    subview.removeFromSuperview()
                }
            }
            if let completion {
                completion()
            }
        }
    }
}

extension ModalView {
    public func show(with customView: UIView? = nil, title: String? = nil) {
        show(with: customView, title: title, completion: nil)
    }
    
    public func show(with customView: UIView? = nil, title: String? = nil, completion: ((Bool) -> Void)?) {
        show(with: customView, title: title, withCloseButton: false, completion: completion)
    }
    
    public func show(with customView: UIView? = nil, title: String? = nil, withCloseButton: Bool, completion: ((Bool) -> Void)?) {
        guard let window = CoreUIUtility.keyWindow else { return }
        if let subview = window.subviews.filter({ $0.tag == CoreUIConstant.ViewTags.overlayTag }).first {
            subview.removeFromSuperview()
        }
        window.addSubview(self)
        frame = window.frame
        if let customView {
            closeContainer.isHidden = !withCloseButton
            contentStack.isHidden = true
            buttonStack.isHidden = true
            modalStackView.addArrangedSubview(customView)
        }
        if let title {
            modalTitle.text = title
        }
        setInitialPosition()
        animateShow(completion: completion)
    }
    
    public func dismissModal(completion: (() -> Void)?) {
        animateDismiss(completion: completion)
    }
    
    public func dismissModal() {
        dismissModal(completion: nil)
    }
    
    public func didTappedOutsideDialog(completion: (() -> Void)?) {
        grayView.addAction {[weak self] in
            self?.dismissModal(completion: completion)
        }
    }
    
    public func showWithGeneralError(_ properties: ModalGeneralErrorProperties) {
        predefinedGeneralError(
            title: properties.title ?? .emptyString,
            titleIcon: properties.titleIcon,
            body: properties.body ?? .emptyString,
            primaryButtonText: properties.primaryButtonText,
            secondaryButtonText: properties.secondaryButtonText,
            isShowCloseButton: properties.isShowCloseButton
        )
        show()
    }
    
    public func showGeneralConfig(_ properties: ModalGeneralConfigProperties) {
        confirmationConfig(body: properties.body ?? .emptyString,
                           title: properties.title ?? .emptyString,
                           subTitle: properties.subTitle ?? .emptyString,
                           titleIcon: properties.titleIcon,
                           description: properties.description ?? .emptyString,
                           primaryButtonText: properties.primaryButtonText,
                           secondaryButtonText: properties.secondaryButtonText,
                           withCloseButton: properties.withCloseButton
        )
        show()
    }
    
    public func showGeneralConfigWithClosure(_ properties: ModalGeneralConfigProperties) {
        closureConfig(properties)
        show()
    }
    
    public func setButtonImages(button: UIButton, leftImage: UIImage?, rightImage: UIImage?) {
        if #available(iOS 15.0, *) {
            let buttonTitleColor = button.titleColor(for: .normal)
            let buttonBackgroundColor = button.backgroundColor
            button.configuration = UIButton.Configuration.filled()
            button.configuration?.baseForegroundColor = buttonTitleColor
            button.configuration?.baseBackgroundColor = buttonBackgroundColor
            button.configuration?.imagePadding = CoreUIConstant.UISpacing.four.rawValue
            if let leftImage = leftImage {
                button.configuration?.image = leftImage
            }
            if let rightImage = rightImage?.withRenderingMode(.alwaysTemplate) {
                button.configuration?.image = rightImage
                button.configuration?.imagePlacement = .trailing
            }
        } else {
            if let leftImage = leftImage {
                button.setImage(leftImage, for: .normal)
                button.imageEdgeInsets = UIEdgeInsets(top: .zero,
                                                      left: -CoreUIConstant.UISpacing.four.rawValue,
                                                      bottom: .zero,
                                                      right: .zero)
            }
            if let rightImage = rightImage?.withRenderingMode(.alwaysTemplate) {
                semanticContentAttribute = .forceRightToLeft
                button.setImage(rightImage, for: .normal)
                button.imageEdgeInsets = UIEdgeInsets(top: .zero,
                                                      left: .zero,
                                                      bottom: .zero,
                                                      right: -CoreUIConstant.UISpacing.four.rawValue)
            }
        }
    }
}
