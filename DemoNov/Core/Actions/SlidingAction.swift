//
//  SlidingAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

struct SlidingAction<T: UIViewController>: Action {
    
    var rootViewController: UIViewController!
    
    init(rootViewController: UIViewController) {
        
        self.rootViewController = rootViewController
    }
    
    func execute() {
        
        AnalyticsManager.sharedInstance?.analytics?.logAction("navigate", target: "sliding")
        
        if let mainNavigationController = rootViewController.slideMenuController()?.mainViewController as? UINavigationController {
            
            if mainNavigationController.topViewController is T {
                
                rootViewController.slideMenuController()?.closeLeft()
                
            } else {
                
                let navigationController = UINavigationController(rootViewController: mainViewController())
                rootViewController.slideMenuController()?.changeMainViewController(navigationController, close: true)
            }
            
        } else {
            
            rootViewController.slideMenuController()?.changeMainViewController(mainViewController(), close: true)
        }
    }
    
    func canBeExecuted() -> Bool {
        
        return rootViewController != nil
    }
    
    private func mainViewController() -> UIViewController {
        
        let mainViewController = T()
        if let icon = UIImage(named: Images.navMenu) {
            mainViewController.addLeftBarButtonWithImage(icon)
        }
        return mainViewController
    }
}
