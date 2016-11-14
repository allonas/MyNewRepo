//
//  MainNavigation.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit
import Foundation
import SlideMenuControllerSwift

class MainNavigation {

    var rootViewController: UIViewController!
    
    lazy var mainController: UIViewController! = {
        return MainMenuViewController()
    }()

    var loginViewController: LoginViewController?
    
    init() {
        
        loginViewController = LoginViewController()
        loginViewController!.loginService = BasicAuthLoginService(appId: "280bde72-6404-4e75-856f-bc30fce7d640")
        loginViewController!.mainViewController = mainController
        
        rootViewController = UINavigationController(rootViewController: loginViewController!)
    }
    
    func logout() {
    
        if let loginViewController = loginViewController, mainViewController = loginViewController.mainViewController {
            
            LoginManager.sharedInstance.reset()
            
            mainViewController.dismissViewControllerAnimated(true, completion: {
            
                self.mainController = nil
                loginViewController.mainViewController = self.mainController
            })
        }
    }
		
}

