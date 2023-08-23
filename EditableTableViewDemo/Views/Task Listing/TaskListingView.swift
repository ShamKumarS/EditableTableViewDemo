//
//  TaskListingView.swift
//  Driven-Day
//
//  Created by BrainX IOS on 20/09/2022.
//

import UIKit

class TaskListingView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var topNavView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var cellSelectedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Intializer Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topNavView.addShadow(color: .black, alpha: 0.05, x: 0, y: 5, radius: 8)
    }
    
    // MARK: - Internal Methods
    
    func getCurrentTime() -> String {
        let date = Date()
        let result = Date.timeFormatter.string(from: date)
        return result
    }
    
    func setDeleteTitle(_ totalSelected: Int) {
        deleteView.isHidden = totalSelected < 1
        cellSelectedLabel.text = "\(totalSelected) \(LocalizedKey.selected.string)"
    }
}
