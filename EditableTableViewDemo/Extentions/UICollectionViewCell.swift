import UIKit

extension UICollectionViewCell {
    
    // MARK: - Static Properties
    
    static var reuseIdentifierForCollection: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    
    static func nibForCollection() -> UINib {
        return UINib(nibName: self.reuseIdentifierForCollection, bundle: nil)
    }
}
