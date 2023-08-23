import Foundation

enum LocalizedKey: String {
    
    // MARK: - Internal Properties
    
    var string: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
    
    // MARK: - Enum cases
    
    case ok = "OK"
    case alert = "Alert"
    case appName = "EditableTableViewDemo"
    case error = "error"
    case today = "Today"
    case older = "Older"
    case hoursAgo = "hours ago"
    case dayAgo = "day ago"
    case daysAgo = "days ago"
    case yearAgo = "yearAgo"
    case yearsAgo = "yearsAgo"
    case monthAgo = "month ago"
    case monthsAgo = "months ago"
    case weekAgo = "week ago"
    case weeksAgo = "weeks ago"
    case minuteAgo = "minute ago"
    case minutesAgo = "minutes ago"
    case justNow = "Just now"
    case addTask = "Add Task"
    case share = "Share"
    case incomplete = "Incomplete"
    case completed = "Completed"
    case selected = "selected"
    case persons = "Persons"
}
