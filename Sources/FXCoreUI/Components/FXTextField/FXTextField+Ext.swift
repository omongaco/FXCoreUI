//
//  File.swift
//  
//
//  Created by Ansyar Hafid on 27/02/24.
//

import UIKit

// MARK: - Public Functions
public extension FXTextField {
    enum Style {
        case basicDefault
        case readOnly
        case disabled
        case error
        case phoneNumber
        case success
        case finished
    }
    
    enum TitleStyle {
        case animated
        case alwaysVisible
        case noTitle
    }
    
    /// Call this function to set the base style of textfield.
    /// - Parameters:
    ///   - style: The base style of textfield.
    ///   - titleStyle: The title style, if `animated`, the title is visible when user tap on textfield
    func configureView(_ style: Style, titleStyle: TitleStyle) {
        self.titleStyle = titleStyle
        
        switch style {
        case .basicDefault:
            setToDefault()
        case .readOnly:
            setToReadOnly()
        case .disabled:
            setToDisabled()
        case .error:
            setToError()
        case .success:
            setToSucces()
        case .phoneNumber:
            setToPhoneNumber()
        case .finished:
            setToFinished()
        }
        
        switch titleStyle {
        case .alwaysVisible:
            setTitleToStatic()
        default:
            return
        }
    }
    
    func forceAnimateTitleLabelDown() {
        let text = textField.text ?? .emptyString
        if text.isEmpty && titleStyle == .animated {
            animateTitleLabelDown()
        }
    }
    
    func forceAnimateTitleLabelUp() {
        if titleStyle == .animated {
            animateTitleLabelUp()
        }
    }
    
    /// Call this fuction if you want to manually set letter spacing attribute to textfield
    func setLetterSpacingOnTextField() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = CoreUIConstant.FontLineHeight.body2Regular
        let attributedString = NSMutableAttributedString(string: textField.text ?? .emptyString)
        let range = NSRange(location: .zero, length: attributedString.length)
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle
        ]
        attributedString.addAttributes(attributes, range: range)
        textField.attributedText = attributedString
    }
    
    func addDeleteButtonToRightButton1() {
        isCommonHandlingDeleteButton = true
        setRightIcon1.send("x.square")
        setRightIconColor1.send(.FlexColor.black)
        checkTextfieldForDeleteButton()
    }
}
// MARK: - Subscribers
extension FXTextField {
    func subscribeToEditingBegin() {
        textField.publisher(for: [UITextField.textDidBeginEditingNotification]).sink {[weak self] notification, text in
            if notification == UITextField.textDidBeginEditingNotification {
                guard let self else { return }
                if titleStyle == .animated {
                    animateTitleLabelUp()
                }
                setContainerBottomBorderColor(borderColorStartEditing)
                setStartEditingAction?()
            }
        }
        .store(in: &cancellables)
    }
    
    func subscribetoEditingChanged() {
        textField.publisher(for: [UITextField.textDidChangeNotification]).sink {[weak self] notification, text in
            if notification == UITextField.textDidChangeNotification {
                guard let self else { return }
                if isCommonHandlingDeleteButton {
                    checkTextfieldForDeleteButton()
                }
                setEditingChangedAction?(text ?? .emptyString)
            }
        }
        .store(in: &cancellables)
    }
    
    func subscribeToEditingEnd() {
        textField.publisher(for: [UITextField.textDidEndEditingNotification]).sink {[weak self] notification, text in
            if notification == UITextField.textDidEndEditingNotification {
                guard let self else { return }
                if let text, text.isEmpty && titleStyle == .animated {
                    animateTitleLabelDown()
                }
                setContainerBottomBorderColor(borderColorEndEditing)
                setEndEditingAction?(text ?? .emptyString)
            }
        }
        .store(in: &cancellables)
    }
    
    func subscribeToSetPlaceholderText() {
        setPlaceholderText
            .sink {[weak self] text in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.titleLabel.text = text
                    self.textField.placeholder = text
                    self.textField.setCustomPlaceholder(font: .body2Regular, color: .FlexColor.graniteGray)
                }
            }
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftImage() {
        setLeftImage
            .filter { !$0.isEmpty }
            .map { [weak self] imageName -> UIImage? in
                guard let self else { return nil }
                leftImage.isHidden = false
                return UIImage(systemName: imageName)
            }
            .sink { [weak self] image in
                DispatchQueue.main.async {
                    self?.leftImage.image = image
                }
            }
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftIcon() {
        setLeftIcon
            .filter { !$0.isEmpty }
            .map { [weak self] imageName -> UIImage? in
                guard let self else { return nil }
                leftIcon.isHidden = false
                return UIImage(systemName: imageName)
            }
            .sink { [weak self] image in
                DispatchQueue.main.async {
                    self?.leftIcon.image = image
                }
            }
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftIconColor() {
        setLeftIconColor
            .sink { [weak self] color in
                DispatchQueue.main.async {
                    self?.leftIcon.tintColor = color
                }
            }
            .store(in: &cancellables)
    }
    
    func subscribeToSetTextFieldText() {
        setTextFieldText
            .sink(receiveValue: { [weak self] text in
                DispatchQueue.main.async {
                    self?.textField.text = text
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToSetRightIcon1() {
        setRightIcon1
            .filter { !$0.isEmpty }
            .map { [weak self] imageName -> UIImage? in
                guard let self else { return nil }
                rightButton1.isHidden = false
                return UIImage(systemName: imageName)
            }
            .sink(receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.rightButton1.setImage(image, for: .normal)
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToSetRightIcon2() {
        setRightIcon2
            .filter { !$0.isEmpty }
            .map { [weak self] imageName -> UIImage? in
                guard let self else { return nil }
                rightButton2.isHidden = false
                return UIImage(systemName: imageName)
            }
            .sink(receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.rightButton2.setImage(image, for: .normal)
                }
            })
            .store(in: &cancellables)
    }

    func subscribeToSetRightIconColor1() {
        setRightIconColor1
            .sink(receiveValue: { [weak self] color in
                DispatchQueue.main.async {
                    self?.rightButton1.tintColor = color
                }
            })
            .store(in: &cancellables)
    }

    func subscribeToRightButton1Action() {
        rightButton1.tapPublisher()
            .sink { [weak self] _ in
                guard let self else { return }
                if isCommonHandlingDeleteButton {
                    textField.text = .emptyString
                    checkTextfieldForDeleteButton()
                }
                setRightButton1Action?()
            }
            .store(in: &cancellables)
    }
    
    func subscribeToRightButton2Action() {
        rightButton2.tapPublisher()
            .sink { [weak self] _ in
                guard let self else { return }
                setRightButton2Action?()
            }
            .store(in: &cancellables)
    }
    
    func subscribeToSetPrefixText() {
        setPrefixText
            .map { [weak self] text in
                guard let self else { return text }
                prefixLabel.isHidden = false
                return text
            }
            .sink(receiveValue: { [weak self] text in
                DispatchQueue.main.async {
                    self?.prefixLabel.text = text
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToSetSuffixText() {
        setSuffixText
            .map { [weak self] text in
                guard let self else { return text }
                suffixLabel.isHidden = false
                return text
            }
            .sink(receiveValue: { [weak self] text in
                DispatchQueue.main.async {
                    self?.suffixLabel.text = text
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftCaptionIcon() {
        setLeftCaptionIcon
            .filter { !$0.isEmpty }
            .map { [weak self] imageName -> UIImage? in
                guard let self else { return nil }
                leftCaptionIcon.isHidden = false
                return UIImage(systemName: imageName)
            }
            .sink(receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.leftCaptionIcon.image = image
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftCaption() {
        setLeftCaption
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.captionStack.isHidden = false
                    self.leftCaption.isHidden = false
                }
                
            })
            .sink(receiveValue: { [weak self] text in
                DispatchQueue.main.async {
                    self?.leftCaption.text = text
                }
            })
            .store(in: &cancellables)
    }

    func subscribeToSetLeftCaptionColor() {
        setLeftCaptionColor
            .sink(receiveValue: { [weak self] color in
                DispatchQueue.main.async {
                    self?.leftCaption.textColor = color
                }
            })
            .store(in: &cancellables)
    }

    func subscribeToSetRightCaption() {
        setRightCaption
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.captionStack.isHidden = false
                    self.rightCaption.isHidden = false
                }
            })
            .sink(receiveValue: { [weak self] text in
                DispatchQueue.main.async {
                    self?.rightCaption.text = text
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftButtonText() {
        setLeftButtonText
            .map { [weak self] text in
                guard self != nil else { return NSAttributedString(string: .emptyString) }
                return NSAttributedString.body2Regular(text ?? .emptyString)
            }
            .sink(receiveValue: { [weak self] attrText in
                DispatchQueue.main.async {
                    self?.leftButton.setAttributedTitle(attrText, for: .normal)
                }
            })
            .store(in: &cancellables)
    }
    
    func subscribeToLeftButtonAction() {
        leftButton.tapPublisher()
            .sink { [weak self] _ in
                guard let self else { return }
                setLeftButtonAction?()
            }
            .store(in: &cancellables)
    }
    
    func subscribeToSetLeftButtonImage() {
        setLeftButtonIcon
            .filter { !$0.isEmpty }
            .map { [weak self] imageName -> UIImage? in
                guard let self else { return nil }
                leftButton.isHidden = false
                leftButton.tintColor = .FlexColor.blue900
                return UIImage(systemName: imageName)
            }
            .sink(receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.leftButton.setImage(image, for: .normal)
                }
            })
            .store(in: &cancellables)
        leftButton.semanticContentAttribute = .forceRightToLeft
    }
}
