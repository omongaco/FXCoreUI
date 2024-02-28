import UIKit
import FXCore

/**
 Use this class to assign your view to custom MavSearchBar
 - In *storyboard*, add `UIButton`.
 - Set its constraint accordingly .
 - Assign your `UIButton` to ``MavButton``. Make sure the `Module` is set to `FXCoreUI`, otherwise it won't work.
 - Connect the view to `@IBOutlet` in your class.
 - Call the public function as needed.
 
 To set the style, call ``setButtonProperties(left:right:text:style:size:)`
 @IBOutlet weak var mavButton: MavButton!
 mavButton.setProperties()
 setProperties have a default value already
 left = nil (Left Image)
 right = nil (Right Image)
 text = emptyString (Button Title)
 style = .primary (Button Style)
 ```swift
 ```
 */
public class FXButton: UIButton {
    // MARK: - Public properties
    public static let defaultHeight: CGFloat = 48
    public static let height32: CGFloat = 32
    
    // MARK: - Private properties
    fileprivate typealias MBC = ButtonConstant
    
    fileprivate enum ButtonConstant {
        static let smallSizePadding: CGFloat = 11
        static let half: CGFloat = 0.5
    }
    
    private var buttonText: String = .emptyString
    private var leftImage: UIImage?
    private var rightImage: UIImage?
    
    private var leftImageView = UIImageView()
    private var rightImageView = UIImageView()
    
    private var color: UIColor = .black
    private var tappedColor: UIColor = .black
    private var background: UIColor = .white
    private var tappedBackground: UIColor = .white
    
    private var buttonStyle: ButtonStyle = .primary
    private var buttonSize: ButtonSize = .large
    private var borderCornerRadius: CGFloat = .zero
    private var iconPadding: CGFloat = CoreUIConstant.UISpacing.four.rawValue
    private var borderColor: UIColor = .clear

    private var fontSize: UIFont? {
        didSet {
            if #available(iOS 15.0, *) {
                configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
                    var outgoing = incoming
                    outgoing.font = self.fontSize
                    return outgoing
                })
            } else {
                titleLabel?.font = self.fontSize
            }
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? tappedBackground : background
            leftImageView.tintColor = isHighlighted ? tappedColor : color
            rightImageView.tintColor = isHighlighted ? tappedColor : color
            setButtonTextAndFont()
        }
    }
    
    public init(frame: CGRect,
                dependency: FXButtonConfigs
    ) {
        super.init(frame: frame)
        setButtonProperties(dependency: dependency)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setButtonProperties(
        dependency: FXButtonConfigs
    ) {
        buttonStyle = dependency.style
        buttonSize = dependency.size
        leftImage = dependency.leftImage
        rightImage = dependency.rightImage
        buttonText = dependency.title

        if #available(iOS 15.0, *) {
            self.configuration = UIButton.Configuration.filled()
        }

        setButtonStyle()
        setButtonTextAndFont()
        configureButton()
    }
    
    private func configureButton() {
        self.backgroundColor = background
        self.layer.cornerRadius = frame.height * MBC.half
        self.setTitle(buttonText, for: .normal)
        self.addBorderLine(width: Int.one.toCGFloat(), color: borderColor)

        if #available(iOS 15.0, *) {
            configuration?.baseForegroundColor = isHighlighted ? tappedColor : color
            configuration?.baseBackgroundColor = self.background
            configuration?.imagePadding = iconPadding
            configuration?.imageColorTransformer = UIConfigurationColorTransformer({ color in
                return self.color
            })
            configuration?.contentInsets = NSDirectionalEdgeInsets(top: .zero,
                                                                   leading: buttonStyle == .quietWithUnderline
                                                                   ? .zero
                                                                   : CoreUIConstant.UISpacing.thirtyTwo.rawValue,
                                                                   bottom: .zero,
                                                                   trailing: buttonStyle == .quietWithUnderline
                                                                   ? .zero
                                                                   : CoreUIConstant.UISpacing.thirtyTwo.rawValue)
            configuration?.cornerStyle = .capsule
            configuration?.titleLineBreakMode = .byTruncatingTail
            if let leftImage = self.leftImage?.withRenderingMode(.alwaysTemplate) {
                configuration?.image = leftImage
            }
            if let rightImage = self.rightImage?.withRenderingMode(.alwaysTemplate) {
                configuration?.image = rightImage
                configuration?.imagePlacement = .trailing
            }
        } else {
            self.backgroundColor = background
            setTitleColor(isHighlighted ? tappedColor : color, for: .normal)
            let inset = UIEdgeInsets(top: .zero,
                                     left: buttonStyle == .quietWithUnderline
                                     ? .zero
                                     : CoreUIConstant.UISpacing.thirtyTwo.rawValue,
                                     bottom: .zero,
                                     right: buttonStyle == .quietWithUnderline
                                     ? .zero
                                     : CoreUIConstant.UISpacing.thirtyTwo.rawValue)
            tintColor = color
            contentEdgeInsets = inset
            if let leftImage = self.leftImage?.withRenderingMode(.alwaysTemplate) {
                setImage(leftImage, for: .normal)
                imageEdgeInsets = UIEdgeInsets(top: .zero, left: -iconPadding, bottom: .zero, right: .zero)
            }
            if let rightImage = self.rightImage?.withRenderingMode(.alwaysTemplate) {
                semanticContentAttribute = .forceRightToLeft
                setImage(rightImage, for: .normal)
                imageEdgeInsets = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: -iconPadding)
            }
        }
    }

    private func setButtonStyle() {
        switch buttonStyle {
        case .primary:
            setPrimaryStyle()
        case .secondary:
            setSecondaryStyle()
        case .quiet:
            setQuietStyle()
        case .quietWithUnderline:
            setQuietUnderlineStyle()
        case .black:
            setBlackStyle()
        case .transparantBorder:
            setTransparantBorder()
        case .clearBorder:
            setClearBorder()
        case .transparantOrange:
            setTransparantOrange()
        case .transparentBackground:
            setTransparentBackground()
        }
    }
    
    private func setButtonTextAndFont() {
        switch buttonSize {
        case .larger:
            setLargerSize()
        case .large:
            setLargeSize()
        case .medium:
            setMediumSize()
        case .small:
            setSmallSize()
        }
    }
    
    private func setPrimaryStyle() {
        color = .FlexColor.black
        background = .FlexColor.turquoise300
        tappedBackground = .FlexColor.turquoise400
    }
    
    private func setSecondaryStyle() {
        color = .FlexColor.black
        background = .FlexColor.white
        tappedBackground = .FlexColor.snowWhite
        borderColor = .FlexColor.graniteGray
    }
    
    private func setQuietStyle() {
        color = .FlexColor.orange700
        background = .FlexColor.offWhite
        tappedColor = .FlexColor.orange400
    }
    
    private func setQuietUnderlineStyle() {
        setUnderline()
        color = .FlexColor.orange300
        background = .clear
        tappedColor = .FlexColor.orange700
    }
    
    private func setBlackStyle() {
        color = .FlexColor.white
        background = .FlexColor.black
        tappedColor = .FlexColor.white
        tappedBackground = .FlexColor.black
    }
    
    private func setTransparantBorder() {
        color = .FlexColor.white
        background = .FlexColor.black.withAlphaComponent(CoreUIConstant.UIAlpha.pointFive.rawValue)
        tappedColor = .FlexColor.white
        tappedBackground = .clear
        borderColor = .FlexColor.white
    }
    
    private func setClearBorder() {
        color = .FlexColor.orange300
        background = .FlexColor.white
        tappedColor = .FlexColor.white
    }
    
    private func setTransparantOrange() {
        color = .FlexColor.orange600
        background = .clear
        tappedColor = .clear
        tappedBackground = .clear
        borderColor = .clear
    }

    private func setTransparentBackground() {
        color = .FlexColor.black
        background = .clear
        borderColor = .FlexColor.graniteGray
    }
    
    private func setLargerSize() {
        fontSize = .headline4Bold
    }
    
    private func setLargeSize() {
        fontSize = .label1DemiBold
    }
    
    private func setMediumSize() {
        fontSize = .label1DemiBold
    }
    
    private func setSmallSize() {
        fontSize = .label2DemiBold
    }
    
    private func setUnderline() {
        self.setAttributedTitle(.underline3Bold(buttonText), for: .normal)
    }
    
    public func disableButton() {
        color = .FlexColor.gray
        background = .FlexColor.snowWhite
        configureButton()
        self.isEnabled = false
    }
    
    public func disableSecondaryButton() {
        color = .FlexColor.gray
        tappedColor = .FlexColor.gray
        background = .FlexColor.white
        borderColor = .FlexColor.gray
        configureButton()
        self.isUserInteractionEnabled = false
    }
    
    public func enableButton() {
        setButtonStyle()
        configureButton()
        self.isEnabled = true
    }
    
    public func enableSecondaryButton() {
        setButtonStyle()
        configureButton()
        self.isUserInteractionEnabled = true
    }
}
