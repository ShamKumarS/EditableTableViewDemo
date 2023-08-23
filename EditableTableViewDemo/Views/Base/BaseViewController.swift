import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableDarkMode()
    }
    
    // MARK: - Overriden Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: - Private Methods
    
    private func disableDarkMode() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    // MARK: - Internal Methods
    
    func showAlertView(message: String) {
        showAlertView(message: message, title: LocalizedKey.appName.string)
    }
    
    func showAlertView(message: String, title: String, doneButtonTitle: String, doneButtonCompletion: ((UIAlertAction) -> Void)?) {
        showAlertView(message: message, title: title, doneButtonTitle: doneButtonTitle, doneButtonCompletion: doneButtonCompletion, cancelButtonTitle: nil, cancelButtonCompletion: nil)
    }
    
    func showAlertView(message: String, title: String, doneButtonTitle: String = LocalizedKey.ok.string.uppercased(), doneButtonCompletion: ((UIAlertAction) -> Void)? = nil, cancelButtonTitle: String? = nil, cancelButtonCompletion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: doneButtonTitle, style: .default, handler: doneButtonCompletion)
        if let cancelTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelButtonCompletion)
            alertController.addAction(cancelAction)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertView(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LocalizedKey.ok.string.uppercased(), style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
