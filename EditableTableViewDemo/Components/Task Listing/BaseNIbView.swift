import Foundation
import UIKit

class BaseNibView: UIView {
    
    // MARK: - Intializer Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Internal Methods
    
    func setup() {
        guard let contentView = loadFromNib() else { return }
        addSubview(contentView)
        contentView.fixInView(self)
    }
}
