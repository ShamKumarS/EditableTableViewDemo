import UIKit

class TaskListingViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var taskListingView: TaskListingView!
    
    // MARK: - Private Properties
    
    private var inEditMode = false
    private var index = -1
    private var totalSelected: Int = 0 {
        didSet {
            taskListingView.setDeleteTitle(totalSelected)
        }
    }
    
    // MARK: - Internal Properties
    
    var taskListingViewModel = TaskListingViewModel()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnLoad()
    }
    
    // MARK: - Private Methods
    
    private func configureOnLoad() {
        taskListingView.titleLabel.text = LocalizedKey.appName.string
        taskListingView.addTapToDismissKeyboard()
        taskListingView.tableView.register(TaskListingTableCell.nib(), forCellReuseIdentifier: TaskListingTableCell.reuseIdentifier)
    }
    
    private func present(_ viewController: BaseViewController) {
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func calendarButtonTapped(_ sender: UIButton) { }
    
    @IBAction
    func deleteTapped(_ sender: UIButton) {
        inEditMode = false
        totalSelected = 0
        taskListingViewModel.deleteSelectedCell()
        taskListingView.tableView.reloadData()
    }
    
    @IBAction
    func crossTapped(_ sender: UIButton) {
        inEditMode = false
        totalSelected = 0
        taskListingViewModel.taskListingData.forEach({ $0.isSelected = false })
        taskListingView.tableView.reloadData()
    }
    
    @objc
    func toggleCheckbox(sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        taskListingViewModel.taskListingData[tag].isCompleted = !taskListingViewModel.taskListingData[tag].isCompleted
        taskListingView.tableView.reloadData()
    }
    
    @objc
    func setSelected(sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        taskListingViewModel.taskListingData[tag].isSelected = !taskListingViewModel.taskListingData[tag].isSelected
        totalSelected = taskListingViewModel.getNumberOfSelected()
        taskListingView.tableView.reloadData()
    }
    
    @objc
    func longPressed(sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            inEditMode = !inEditMode
            taskListingView.tableView.reloadData()
            totalSelected = 0
            taskListingViewModel.taskListingData.forEach({ $0.isSelected = false })
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension TaskListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskListingViewModel.taskListingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskListingTableCell = tableView.dequeueCell(for: indexPath)
        let model = taskListingViewModel.taskListingData[indexPath.row]
        cell.popuplateViewWith(model, andTag: indexPath.row)
        cell.setCheckboxView(inEditMode)
        cell.taskStatusView.addTapAction(#selector(toggleCheckbox), target: self)
        cell.customContentView.addLongTapAction(#selector(longPressed), target: self)
        cell.checkboxButton.addTapAction(#selector(setSelected), target: self)
        return cell
    }
}

// MARK: - UITableViewDelegate Methods

extension TaskListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
