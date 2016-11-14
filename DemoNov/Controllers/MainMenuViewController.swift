//
//  MainMenuViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class MainMenuViewController: SimpleTabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
		view.backgroundColor = Style.sharedInstance.backgroundColor
		
		let tab1 = MyExpensesTrackerMenuItem1ViewController()
		tab1.tabBarItem = UITabBarItem(title: "Expense Tracker", image: UIImage(named: "DefaultMenuIcon.png"), tag: 0)
 
		let tab2 = ExpensesViewController()
		tab2.tabBarItem = UITabBarItem(title: "Expenses", image: UIImage(named: "DefaultMenuIcon.png"), tag: 1)
 
		let tab3 = CustomViewController()
		tab3.tabBarItem = UITabBarItem(title: "Static", image: UIImage(named: "DefaultMenuIcon.png"), tag: 2)
 
		tab1.behaviors.append(LogoutBehavior(viewController: tab1))
		tab2.behaviors.append(LogoutBehavior(viewController: tab2))
		tab3.behaviors.append(LogoutBehavior(viewController: tab3))

		viewControllers = [
            UINavigationController(rootViewController: tab1),
            UINavigationController(rootViewController: tab2),
            UINavigationController(rootViewController: tab3),
        
		]
		
        
    }
}

