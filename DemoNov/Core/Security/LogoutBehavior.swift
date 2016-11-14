//
//  LogoutBahavior.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class LogoutBehavior: NSObject, Behavior {
    
    var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
    }
    
    func load() {
        
        let button = UIBarButtonItem(image: UIImage(named: Images.logout), style: .Plain, target: self, action: #selector(logoutAction))
        if viewController.navigationItem.rightBarButtonItems == nil {
            viewController.navigationItem.rightBarButtonItems = []
        }
        viewController.navigationItem.rightBarButtonItems?.insert(button, atIndex: 0)
    }
    
    func logoutAction() {
        
        let logoutAction = LogoutAction()
        if logoutAction.canBeExecuted() {
            logoutAction.execute()
        }
    }
}