import UIKit

// MARK: - UITableView Methods

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(for indexpath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexpath) as! T
    }
}