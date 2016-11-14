//
//  NavigationAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

enum NavigationType {

    case Auto
    case Push
    case Modal
}

struct NavigationAction<T: UIViewController>: Action {

    var rootViewController: UIViewController!
    var type: NavigationType!
    
    init(rootViewController: UIViewController, type: NavigationType? = .Push) {
    
        self.rootViewController = rootViewController
        self.type = type
    }
    
    func execute() {
        
        AnalyticsManager.sharedInstance?.analytics?.logAction("navigate", target: String(type))
        switch type as NavigationType {
        case .Push:
            navigationPush()
            break
        case .Modal:
            navigationModal()
            break
        default:
            navigationAuto()
            break
        }
    }
    
    func canBeExecuted() -> Bool {
        
        return rootViewController != nil
    }
    
    private func navigationAuto() {
    
        if rootViewController.navigationController != nil {
        
            navigationPush()
        
        } else {
        
            navigationModal()
        }
    }
    
    private func navigationPush() {
        
        let destinationViewController = T()
        destinationViewController.hidesBottomBarWhenPushed = true
        
        rootViewController.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    private func navigationModal() {
        
        rootViewController.presentViewController(T(),
                                                 animated: true,
                                                 completion: nil)
    }
}