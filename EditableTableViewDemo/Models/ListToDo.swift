import Foundation

class ListToDo {
    
    // MARK: - Internal Properties
    
    var id = AppConstants.empty
    var title = AppConstants.empty
    var errorTitle = AppConstants.empty
    var isCompleted = false
    
    // MARK: - Initializer Methods
    
    init(title: String, errorTitle: String = AppConstants.empty, isCompleted: Bool = false) {
        self.title = title
        self.errorTitle = errorTitle
        self.isCompleted = isCompleted
    }
}
