import Foundation

class Task {
    
    // MARK: - Internal Properties
    
    var title = AppConstants.empty
    var description = AppConstants.empty
    var taskList = [ListToDo]()
    var sharedWith = [ShareWith]()
    var isCompleted = false
    var isSelected = false
    var accessLevel = AccessControl.view.rawValue
    
    // MARK: - Initializer Methods
    
    init(title: String,
         description: String,
         taskList: [ListToDo],
         sharedWith: [ShareWith],
         isCompleted: Bool = false,
         accessLevel: String = AccessControl.view.rawValue) {
        self.title = title
        self.description = description
        self.taskList = taskList
        self.sharedWith = sharedWith
        self.isCompleted = isCompleted
        self.accessLevel = accessLevel
    }
}
