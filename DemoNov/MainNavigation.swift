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
        return UINavigationController(rootViewController: ExpenseTrackerViewController())
    }()

	
	init() {
        
        self.rootViewController = mainController
    }
		
}

