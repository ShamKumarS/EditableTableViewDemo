import Foundation
import UIKit

enum Border: String {
    case top = "topBorder"
    case bottom = "bottomBorder"
    case left = "leftBorder"
    case right = "rightBorder"
}

extension UIView {
    
    // MARK: - Static Properties
    
    static var identifierForView: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    
    static func nibForView() -> UINib {
        return UINib(nibName: self.identifierForView, bundle: nil)
    }
    
    // MARK: - Internal Methods
    
    func setBorderColor(_ color: UIColor, andWidth width: CGFloat = 1.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func addBorder(_ border: Border, withColor color: UIColor, andWidth width: CGFloat) {
        let borderLayer = CALayer()
        borderLayer.name = border.rawValue
        borderLayer.backgroundColor = color.cgColor
        switch border {
        case .top:
            borderLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .bottom:
            borderLayer.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: width)
        case .left:
            borderLayer.frame = CGRect(x: 0, y: 0, width: width, height: frame.size.height)
        case .right:
            borderLayer.frame = CGRect(x: frame.size.width - width, y: 0, width: width, height: frame.size.height)
        }
        layer.addSublayer(borderLayer)
    }
    
    func setCornerRadius(_ r : CGFloat, andClipContent clip: Bool = false) {
        layer.cornerRadius = r
        layer.masksToBounds = clip
    }
    
    func setCornerRadius(_ r: CGFloat, forCorners corners: CACornerMask, andClipContent clip: Bool = false) {
        layer.maskedCorners = corners
        setCornerRadius(r, andClipContent: clip)
    }
    
    func addShadow(color: UIColor = Color.whiskey,
                   alpha: Float = 1,
                   x: CGFloat = 0,
                   y: CGFloat = 2,
                   radius: CGFloat = 2 ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowOpacity = alpha
        layer.shadowRadius = radius
    }
    
    func addTapToDismissKeyboard() {
        addTapAction(#selector(dismissKeyboard))
    }
    
    func addTapAction(_ action: Selector, target: Any? = nil) {
        let tapGesture = UITapGestureRecognizer(target: target ?? self, action: action)
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    func addLongTapAction(_ action: Selector, target: Any? = nil) {
        let longPressRecognizer = UILongPressGestureRecognizer(target: target ?? self, action: action)
        longPressRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(longPressRecognizer)
    }
    
    @discardableResult
    func loadFromNib<T: UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }
    
    @discardableResult
    func addGradient(_ direction: GradientDirection, withColor colors: [UIColor], cornerRadius: CGFloat = 0, shouldPushInBackground: Bool = true) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = direction.start
        gradientLayer.endPoint = direction.end
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        if shouldPushInBackground {
            layer.insertSublayer(gradientLayer, at: 0)
        } else {
            layer.addSublayer(gradientLayer)
        }
        return gradientLayer
    }
    
    func fixInView(_ container: UIView) {
        frame = container.bounds
        container.addSubview(self)
        addEqualConstraintsWith(container)
    }
    
    func addEqualConstraintsWith(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)].forEach { $0.isActive = true }
    }
    
    // MARK: - Action Methods
    
    @objc
    func dismissKeyboard() {
        endEditing(true)
    }
}
