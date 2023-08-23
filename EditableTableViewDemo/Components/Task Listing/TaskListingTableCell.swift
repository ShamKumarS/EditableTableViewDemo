//
//  TaskListingTableCell.swift
//  Driven-Day
//
//  Created by BrainX IOS on 20/09/2022.
//

import UIKit

class TaskListingTableCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var customContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var verticalLineView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var horizentalLineView: UIView!
    @IBOutlet weak var personsView: TaskListCustomButtonView!
    @IBOutlet weak var shareView: TaskListCustomButtonView!
    @IBOutlet weak var taskStatusView: TaskListCustomButtonView!
    @IBOutlet weak var checkboxView: UIView!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var buttonsStack: UIStackView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Private Properties
    
    private var itemsData = [ListToDo]()
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        customContentView.setCornerRadius(10, andClipContent: true)
        verticalLineView.setCornerRadius(verticalLineView.frame.width/2)
        personsView.setTitle(LocalizedKey.persons.string, andImage: Images.personsIcon)
        shareView.setTitle(LocalizedKey.share.string, andImage: Images.shareIcon)
        taskStatusView.setTitle(LocalizedKey.incomplete.string, andImage: Images.emptyRectangle)
        verticalLineView.backgroundColor = UIColor(hex: TaskListingViewModel.colorHex)
    }
    
    private func setTitle(_ title: String, withStrikeThrough strikeThrough: Bool) {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: title)
        if strikeThrough {
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 5, range: NSRange(location: 0, length: attributeString.length))
        }
        titleLabel.attributedText = attributeString
    }
    
    private func setShareVisibilty(_ accessLevel: String) {
        if accessLevel == AccessControl.view.rawValue {
            shareView.checkboxImage.isHidden = true
            shareView.titleLabel.textColor = .white
            shareView.isUserInteractionEnabled = false
        } else {
            shareView.checkboxImage.isHidden = false
            shareView.titleLabel.textColor = Color.monsoon
            shareView.isUserInteractionEnabled = true
        }
    }
    
    private func setViewWith(_ tag: Int) {
        checkboxButton.tag = tag
        personsView.tag = tag
        shareView.tag = tag
        taskStatusView.tag = tag
    }
    
    func getCurrentTime() -> String {
        let date = Date()
        let result = Date.timeFormatter.string(from: date)
        return result
    }
    
    // MARK: - Internal Methods
    
    func popuplateViewWith(_ model: Task, andTag tag: Int) {
        shareView.isHidden = model.accessLevel == AccessControl.view.rawValue
        setTitle(model.title, withStrikeThrough: model.isCompleted)
        timeLabel.text = getCurrentTime()
        descriptionLabel.text = model.description
        personsView.titleLabel.text = "\(model.sharedWith.count) \(LocalizedKey.persons.string)"
        taskStatusView.setSelected(model.isCompleted)
        setSelected(model.isSelected)
        itemsData = []
        itemsData = model.taskList
        setTableView()
        setViewWith(tag)
        setShareVisibilty(model.accessLevel)
        itemsTableView.tag = tag
    }
    
    func setTableView() {
        itemsTableView.dataSource = self
        itemsTableView.register(TaskListingCheckboxCell.nib(), forCellReuseIdentifier: TaskListingCheckboxCell.reuseIdentifier)
        itemsTableView.reloadData()
        layoutIfNeeded()
    }
    
    func setSelected(_ isSelected: Bool) {
        let image = isSelected ? Images.taskListingChecked : Images.taskListingUnchecked
        checkboxButton.setImage(UIImage(named: image), for: .normal)
    }
    
    func setCheckboxView(_ shouldHide: Bool) {
        checkboxView.isHidden = !shouldHide
        itemsTableView.isUserInteractionEnabled = !shouldHide
        buttonsStack.isUserInteractionEnabled = !shouldHide
        taskStatusView.isUserInteractionEnabled = !shouldHide
    }
    
    // MARK: - Action Methods
    
    @objc
    func itemCheckboxTapped(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        let item = itemsData[tag]
        itemsData[tag].isCompleted = !item.isCompleted
        itemsTableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource Methods

extension TaskListingTableCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewHeightConstraint.constant = CGFloat(itemsData.count * 20)
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskListingCheckboxCell = tableView.dequeueCell(for: indexPath)
        let item = itemsData[indexPath.row]
        cell.setTitle(item.title, withIsSelected: item.isCompleted, andTag: indexPath.row)
        cell.checkboxImage.addTapAction(#selector(itemCheckboxTapped), target: self)
        return cell
    }
}
