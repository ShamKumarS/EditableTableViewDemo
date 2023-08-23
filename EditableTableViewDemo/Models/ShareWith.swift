//
//  ShareWith.swift
//  Driven-Day
//
//  Created by BrainX IOS on 20/10/2022.
//

import Foundation

enum AccessControl: String {
    
    case view = "VIEW"
    case edit = "EDIT"
}

class ShareWith {
    
    // MARK: - Internal Properties
    
    var id = AppConstants.empty
    var email = AppConstants.empty
    var errorTitle = AppConstants.empty
    var accessLevel = AccessControl.view.rawValue
    
    // MARK: - Initializer Methods
    
    init(email: String, accessLevel: String = AccessControl.view.rawValue, errorTitle: String = AppConstants.empty) {
        self.email = email
        self.accessLevel = accessLevel
        self.errorTitle = errorTitle
    }
}
