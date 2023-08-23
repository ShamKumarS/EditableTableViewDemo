import UIKit

extension UIViewController {
    
    // MARK: - Static Properties
    
    static var storyboardId: String {
        String(describing: self)
    }
    
    // MARK: - Static Methods
    
    static func instantiate(from storyboardName: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
    
    // MARK: - Internal Methods
    
    func showErrorAlert(withTitle title: String = LocalizedKey.alert.string, withMessage message: String, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: LocalizedKey.ok.string, style: .default, handler: okHandler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
