import Foundation

extension Dictionary {
    
    // MARK: - Mutating Methods
    
    mutating func merge(dict: [Key: Value]) {
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
