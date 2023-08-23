//
//  TaskListingViewModel.swift
//  Driven-Day
//
//  Created by BrainX IOS on 22/09/2022.
//

import Foundation

class TaskListingViewModel {
    
    // MARK: - Internal Properties
    
    var taskListingData = [Task]()
    var date = AppConstants.empty
    static var colorHex = "#CBAD00"
    
    // MARK: - Initializer Methods
    
    init() {
        populateData()
        date = getCurrentDate()
    }

    // MARK: - Internal Methods
    
    func populateData() {
        taskListingData.append(Task(title: "My notes",
                                    description: "This notes belongs to me. No one can touch it. You are allowed to read it but not edit it.",
                                    taskList: [ListToDo(title: "read book"),
                                               ListToDo(title: "play cricket"),
                                               ListToDo(title: "watch movies")],
                                    sharedWith: [ShareWith(email: "ali@gmail.com"),
                                                 ShareWith(email: "aslam@gmail.com")],
                                    isCompleted: false))
        taskListingData.append(Task(title: "My notes",
                                    description: "This notes belongs to me. No one can touch it.",
                                    taskList: [ListToDo(title: "watch movies"),
                                               ListToDo(title: "play cricket"),
                                               ListToDo(title: "read book")],
                                    sharedWith: [ShareWith(email: "ali@gmail.com")],
                                    isCompleted: true,
                                    accessLevel: AccessControl.edit.rawValue))
        taskListingData.append(Task(title: "My notes",
                                    description: "This notes belongs to me. No one can touch it.",
                                    taskList: [ListToDo(title: "play cricket"),
                                               ListToDo(title: "read book"),
                                               ListToDo(title: "watch movies")],
                                    sharedWith: [ShareWith(email: "ali@gmail.com"),
                                                 ShareWith(email: "aslam@gmail.com"),
                                                 ShareWith(email: "aslam@gmail.com")],
                                    isCompleted: false))
    }
    
    func deleteSelectedCell() {
        taskListingData = taskListingData.filter({ !$0.isSelected })
    }
    
    func getNumberOfSelected() -> Int {
        return taskListingData.filter({ $0.isSelected }).count
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let result = Date.iso8601.string(from: date)
        return result
    }
}
