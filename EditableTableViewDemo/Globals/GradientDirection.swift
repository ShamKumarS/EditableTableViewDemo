import UIKit

enum GradientDirection {
    
    // MARK: - Enum cases
    
    case vertical
    case horizontal
    case diagonal
    
    // MARK: - Internal Properties
    
    var start: CGPoint {
        return CGPoint(x: 0, y: 0)
    }
    
    var end: CGPoint {
        switch self {
        case .vertical: return CGPoint(x: 0, y: 1)
        case .horizontal: return CGPoint(x: 1, y: 0)
        case .diagonal: return CGPoint(x: 1, y: 1)
        }
    }
}
