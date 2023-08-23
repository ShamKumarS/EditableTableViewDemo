import UIKit

extension UICollectionView {
    
    // MARK: - Internal Methods
    
    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifierForCollection, for: indexPath) as! T
    }
}
