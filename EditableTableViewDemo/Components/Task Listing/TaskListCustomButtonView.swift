//
//  CheckboxView.swift
//  Driven-Day
//
//  Created by BrainX IOS on 20/09/2022.
//

import UIKit

class TaskListCustomButtonView: BaseNibView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var checkboxImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Internal Methods
    
    func setTitle(_ title: String, andImage image: String) {
        titleLabel.text = title
        checkboxImage.image = UIImage(named: image)
    }
    
    func setSelected(_ isSelected: Bool) {
        titleLabel.text = isSelected ? LocalizedKey.completed.string : LocalizedKey.incomplete.string
        checkboxImage.image = isSelected ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square")
        checkboxImage.tintColor = UIColor(hex: TaskListingViewModel.colorHex)
    }
}
