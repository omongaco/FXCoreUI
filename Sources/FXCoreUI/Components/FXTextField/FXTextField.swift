//
//  FXTextField.swift
//  FXCoreUI
//
//  Created by Ansyar Hafid.
//

import UIKit
import Combine

public class FXTextField: UIView {
    // MARK: - IBOutlets
    @IBOutlet public weak var containerView: UIView!
    @IBOutlet public weak var leftImage: UIImageView!
    @IBOutlet public weak var leftButton: UIButton!
    @IBOutlet public weak var leftIcon: UIImageView!
    @IBOutlet public weak var prefixLabel: UILabel!
    @IBOutlet public weak var titleLabel: UILabel!
    
    @IBOutlet public weak var textField: CustomUITextField!
    @IBOutlet public weak var suffixLabel: UILabel!
    @IBOutlet public weak var rightButton1: UIButton!
    @IBOutlet public weak var rightButton2: UIButton!
    @IBOutlet public weak var containerBottomBorder: UIView!
    @IBOutlet public weak var captionStack: UIStackView!
    @IBOutlet public weak var leftCaptionIcon: UIImageView!
    @IBOutlet public weak var leftCaption: UILabel!
    @IBOutlet public weak var rightCaption: UILabel!
    @IBOutlet public weak var insideCaptionStack: UIStackView!
    
    // MARK: - Variables
    var cancellables = Set<AnyCancellable>()
    var borderColorStartEditing: UIColor = .clear
    var borderColorEndEditing: UIColor = .clear
    var titleStyle: TitleStyle = .animated
    var isCommonHandlingDeleteButton: Bool = false

    /// Emit a value to this subject, will assign the value to both textfield's placeholder and title label.
    public let setPlaceholderText = PassthroughSubject<String?, Never>()

    /// Emit a value to this subject, will automatically make the left image `isHidden` set to false.
    public let setLeftImage = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon `isHidden` set to false.
    public let setLeftIcon = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon `isHidden` set to false.
    public let setLeftIconColor = PassthroughSubject<UIColor, Never>()
    
    /// Emit a value to this subject, will automatically apply the attributedText
    public let setTextFieldText = PassthroughSubject<String?, Never>()
    
    /// Emit a value to this subject, will automatically make the ``prefixLabel`` `isHidden` set
    /// to false
    public let setPrefixText = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the ``suffixLabel`` `isHidden` set
    /// to false
    public let setSuffixText = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will assign the value to left button title label.
    public let setLeftButtonText = PassthroughSubject<String?, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon `isHidden` set to false.
    public let setLeftButtonIcon = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon `isHidden` set to false.
    public let setRightIcon1 = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon `isHidden` set to false.
    public let setRightIcon2 = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon `isHidden` set to false.
    public let setRightIconColor1 = PassthroughSubject<UIColor, Never>()
    
    /// Custom closure when user tap on `textfield`.
    public var setStartEditingAction: (() -> Void)?
    
    /// Custom closure when user typing on `textfield`.
    public var setEditingChangedAction: ((String) -> Void)?
    
    /// Custom closure when user did end editing on `textfield`.
    public var setEndEditingAction: ((String) -> Void)?
    
    /// Action when ``leftButton`` on tap.
    public var setLeftButtonAction: (() -> Void)?
    
    /// Action when ``rightButton1`` on tap.
    public var setRightButton1Action: (() -> Void)?
    
    /// Action when ``rightButton2`` on tap.
    public var setRightButton2Action: (() -> Void)?
    
    /// Emit a value to this subject, will automatically make the ``leftCaption`` `isHidden` set
    /// to false
    public let setLeftCaption = PassthroughSubject<String, Never>()
    
    public let setLeftCaptionColor = PassthroughSubject<UIColor, Never>()
    
    /// Emit a value to this subject, will automatically make the left icon caption `isHidden` set to false.
    public let setLeftCaptionIcon = PassthroughSubject<String, Never>()
    
    /// Emit a value to this subject, will automatically make the ``rightCaption`` `isHidden` set
    /// to false
    public let setRightCaption = PassthroughSubject<String, Never>()
    
    /// Allows or prevents paste action. Default is set to true
    public var allowsPaste: Bool = true {
        didSet {
            textField.allowsPaste = allowsPaste
        }
    }
    
    /// Allows or prevents copy action. Default is set to true
    public var allowsCopy: Bool = true {
        didSet {
            textField.allowCopy = allowsCopy
        }
    }
    
    /// Corner type for radius . Default is set to .allCorners
    public var cornerType: CACornerMask = .allCorners {
        didSet {
            containerView.cornerRadius(cornerRadiusValue, cornerType: cornerType)
        }
    }
    
    /// Corner Radius Value
    public var cornerRadiusValue: CGFloat = CoreUIConstant.UISizing.small.rawValue {
        didSet {
            containerView.cornerRadius(cornerRadiusValue, cornerType: cornerType)
        }
    }
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadAllFunctions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAllFunctions()
    }
}

// MARK: - Internal Function
extension FXTextField {
    func loadAllFunctions() {
        initialSetup()
        subscribeToEditingBegin()
        subscribetoEditingChanged()
        subscribeToEditingEnd()
        subscribeToSetPlaceholderText()
        subscribeToSetLeftImage()
        subscribeToSetLeftIcon()
        subscribeToSetLeftIconColor()
        subscribeToSetTextFieldText()
        subscribeToSetPrefixText()
        subscribeToSetSuffixText()
        subscribeToSetRightIcon1()
        subscribeToSetRightIcon2()
        subscribeToSetLeftButtonImage()
        subscribeToSetLeftButtonText()
        subscribeToLeftButtonAction()
        subscribeToRightButton1Action()
        subscribeToRightButton2Action()
        subscribeToSetRightIconColor1()
        subscribeToSetLeftCaption()
        subscribeToSetLeftCaptionColor()
        subscribeToSetRightCaption()
        subscribeToSetLeftCaptionIcon()
        configureUI()
        configureTextField()
        configurePrefixSuffix()
        configureCaption()
        initialStateTitleLabel()
        hideOtherComponents()
    }
    
    func initialSetup() {
        let view = loadNib()
        addSubview(view)
        view.frame = bounds
        view.backgroundColor = .clear
    }
    
    func configureUI() {
        containerView.cornerRadius(cornerRadiusValue)
        containerView.layer.borderWidth = Int.one.toCGFloat()
        titleLabel.attributedText = .label2Regular(titleLabel.text ?? .emptyString)
    }
    
    func setContainerBottomBorderColor(_ color: UIColor) {
        containerView.layer.borderColor = color.cgColor
    }
    
    func configureTextField() {
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .FlexColor.black
        textField.clearButtonMode = .never
        textField.font = .body2Regular
    }
    
    func configurePrefixSuffix() {
        prefixLabel.attributedText = .body2Regular(prefixLabel.text ?? .emptyString)
        prefixLabel.textColor = .FlexColor.blue900
        suffixLabel.attributedText = .body2Regular(suffixLabel.text ?? .emptyString)
        suffixLabel.textColor = .FlexColor.blue900
    }
    
    func configureCaption() {
        leftCaption.attributedText = .label2Regular(leftCaption.text ?? .emptyString)
        rightCaption.attributedText = .label2Regular(rightCaption.text ?? .emptyString)
    }
    
    func initialStateTitleLabel() {
        titleLabel.transform = CGAffineTransform(translationX: .zero,
                                                 y: CoreUIConstant.UISizing.small.rawValue)
        titleLabel.alpha = .zero
        titleLabel.isHidden = true
    }
    
    func animateTitleLabelUp() {
        UIView.animate(
            withDuration: CoreUIConstant.UIAlpha.pointOne.rawValue,
            delay: .zero,
            options: .curveLinear
        ) { [weak self] in
            guard let self else { return}
            titleLabel.isHidden = false
            titleLabel.transform = .identity
            titleLabel.alpha = Int.one.toCGFloat()
            textField.placeholder = nil
        }
    }
    
    func animateTitleLabelDown() {
        UIView.animate(
            withDuration: CoreUIConstant.UIAlpha.pointOne.rawValue,
            delay: .zero,
            options: .curveLinear
        ) { [weak self] in
            guard let self else { return }
            initialStateTitleLabel()
        } completion: { [weak self] isFinished in
            guard let self, isFinished else { return }
            textField.placeholder = titleLabel.text
        }
    }
    
    func hideOtherComponents() {
        leftImage.isHidden = true
        leftIcon.isHidden = true
        prefixLabel.isHidden = true
        suffixLabel.isHidden = true
        leftButton.isHidden = true
        rightButton1.isHidden = true
        rightButton2.isHidden = true
        leftCaptionIcon.isHidden = true
        leftCaption.isHidden = true
        rightCaption.isHidden = true
    }
    
    func checkTextfieldForDeleteButton() {
        let currentText = textField.text ?? .emptyString
        rightButton1.isHidden = currentText.isEmpty
    }
}

// MARK: - Internal Implementation
extension FXTextField {
    func setToDefault() {
        containerView.backgroundColor = .FlexColor.white
        borderColorStartEditing = .FlexColor.black
        borderColorEndEditing = .FlexColor.lightGray
        setContainerBottomBorderColor(borderColorEndEditing)
        titleLabel.textColor = .FlexColor.black
        leftCaption.textColor = .FlexColor.black
        rightCaption.textColor = .FlexColor.black
    }
    
    func setToReadOnly() {
        containerView.backgroundColor = .FlexColor.snowWhite
        borderColorStartEditing = .FlexColor.paleGray
        borderColorEndEditing = .FlexColor.paleGray
        setContainerBottomBorderColor(borderColorEndEditing)
        titleLabel.textColor = .FlexColor.charcoalGray
        leftCaption.textColor = .FlexColor.charcoalGray
        rightCaption.textColor = .FlexColor.charcoalGray
        textField.isUserInteractionEnabled = false
        rightButton1.isUserInteractionEnabled = false
        rightButton2.isUserInteractionEnabled = false
    }
    
    func setToDisabled() {
        containerView.backgroundColor = .FlexColor.snowWhite
        borderColorStartEditing = .FlexColor.paleGray
        borderColorEndEditing = .FlexColor.paleGray
        setContainerBottomBorderColor(borderColorEndEditing)
        titleLabel.textColor = .FlexColor.charcoalGray
        leftCaption.textColor = .FlexColor.charcoalGray
        rightCaption.textColor = .FlexColor.charcoalGray
        textField.textColor = .FlexColor.gray
        textField.isUserInteractionEnabled = false
        rightButton1.isUserInteractionEnabled = false
        rightButton2.isUserInteractionEnabled = false
    }
    
    func setToError() {
        containerView.backgroundColor = .FlexColor.white
        borderColorStartEditing = .FlexColor.error1
        borderColorEndEditing = .FlexColor.error1
        setContainerBottomBorderColor(borderColorEndEditing)
        titleLabel.textColor = .FlexColor.black
        leftCaption.textColor = .FlexColor.error1
        rightCaption.textColor = .FlexColor.error1
    }
    
    func setToSucces() {
        containerView.backgroundColor = .FlexColor.white
        borderColorStartEditing = .FlexColor.success2
        borderColorEndEditing = .FlexColor.success2
        setContainerBottomBorderColor(borderColorEndEditing)
        titleLabel.textColor = .FlexColor.success2
        leftCaption.textColor = .FlexColor.success2
        rightCaption.textColor = .FlexColor.success2
    }
    
    func setTitleToStatic() {
        titleStyle = .alwaysVisible
        titleLabel.transform = .identity
        titleLabel.alpha = Int.one.toCGFloat()
        titleLabel.isHidden = false
    }
    
    func setToPhoneNumber() {
        containerView.backgroundColor = .FlexColor.white
        borderColorStartEditing = .FlexColor.blue900
        borderColorEndEditing = .FlexColor.lightGray
        setContainerBottomBorderColor(borderColorStartEditing)
        titleLabel.textColor = .FlexColor.black
        leftCaption.textColor = .FlexColor.blue900
        rightCaption.textColor = .FlexColor.blue900
        leftButton.setTitleColor(.FlexColor.blue900, for: .normal)
    }
    
    func setToFinished() {
        containerView.backgroundColor = .FlexColor.white
        borderColorStartEditing = .FlexColor.pepper300
        borderColorEndEditing = .FlexColor.lightGray
        setContainerBottomBorderColor(borderColorStartEditing)
        titleLabel.textColor = .FlexColor.black
        leftCaption.textColor = .FlexColor.black
        rightCaption.textColor = .FlexColor.black
    }
}

/// Custom UITextField to allow/prevent paste action for certain text fields.
public class CustomUITextField: UITextField {
    public var allowsPaste: Bool = true
    public var allowCopy: Bool = true
    
    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if !allowsPaste, action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        } else if !allowCopy, action == #selector(UIResponderStandardEditActions.copy(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
