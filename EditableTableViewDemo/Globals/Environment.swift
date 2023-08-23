import Foundation

enum Environment {
    
    // MARK: - Enum cases
    
    case development
    case staging
    case production
    
    // MARK: - Static Properties
    
    static var current: Environment { return .development }
    static var baseUrl: URL? {
        switch current {
        case .development: return URL(string: "https://driven-day.brainxdemo.com/api/")
        case .staging: return URL(string: "https://driven-day.brainxdemo.com/api/")
        default:
            return URL(string: AppConstants.empty)
        }
    }
}
