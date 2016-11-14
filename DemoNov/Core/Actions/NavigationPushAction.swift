//
//  NavigationPushAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

struct NavigationPushAction: Action {
    
    var rootViewController: UIViewController!
    var destinationViewController: UIViewController?
    
    init(rootViewController: UIViewController, destinationViewController: UIViewController?) {
        
        self.rootViewController = rootViewController
        self.destinationViewController = destinationViewController
    }
    
    func execute() {
        
        if let destinationViewController = destinationViewController {
        
            AnalyticsManager.sharedInstance?.analytics?.logAction("navigatePush", target: NSStringFromClass(destinationViewController.classForCoder))
            rootViewController.navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }
    
    func canBeExecuted() -> Bool {
        
        return rootViewController != nil && destinationViewController != nil
    }
}
