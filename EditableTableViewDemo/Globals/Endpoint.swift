import Foundation

enum Endpoint {
    
    // MARK: - Static Properties
    
    static var signup: URL? {
        URL(string: "users/signup", relativeTo: Environment.baseUrl)
    }
    
    static var deletTasks: (String) -> URL? = {
        URL(string: "tasks/delete?taskIds=\($0)", relativeTo: Environment.baseUrl)
    }
}
