//
//  TaskListingCheckboxCell.swift
//  Driven-Day
//
//  Created by BrainX IOS on 20/09/2022.
//

import UIKit

class TaskListingCheckboxCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var customContentView: UIView!
    @IBOutlet weak var checkboxImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Internal Methods
    
    func setTitle(_ title: String?, withIsSelected selected: Bool?, andTag tag: Int) {
        titleLabel.text = title ?? AppConstants.empty
        setSelected(selected ?? false)
        checkboxImage.tag = tag
    }
    
    func setSelected(_ isSelected: Bool) {
        checkboxImage.image = isSelected ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square")
        checkboxImage.tintColor = UIColor(hex: TaskListingViewModel.colorHex)
    }
}
