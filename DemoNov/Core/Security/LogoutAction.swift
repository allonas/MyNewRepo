//
//  LogoutAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class LogoutAction: Action {

    var mainNavigation: MainNavigation?
    
    init() {
    
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            mainNavigation = appDelegate.mainNavigation
        }
    }
    
    func canBeExecuted() -> Bool {
        
        return mainNavigation?.loginViewController != nil
    }
    
    func execute() {
        
        mainNavigation?.logout()
    }
}