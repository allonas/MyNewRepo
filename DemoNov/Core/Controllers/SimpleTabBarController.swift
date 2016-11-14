//
//  SimpleTabBarController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class SimpleTabBarController: UITabBarController {
    
    var moreTableViewDataSource: UITableViewDataSource!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.sharedInstance.backgroundColor
        view.tintColor = Style.sharedInstance.foregroundColor
        
        if let tableView = moreNavigationController.topViewController?.view as? UITableView {
            
            moreTableViewDataSource = tableView.dataSource
            tableView.dataSource = self
        }
        
        delegate = self
    }
}

extension SimpleTabBarController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return moreTableViewDataSource.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = moreTableViewDataSource.tableView(tableView, cellForRowAtIndexPath: indexPath)
        cell.backgroundView = nil
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = Style.sharedInstance.font
        cell.textLabel?.textColor = Style.sharedInstance.foregroundColor
        
        let icon = UIImage(named: Images.arrow)?.imageWithRenderingMode(.AlwaysTemplate)
        let accessoryImageView = UIImageView(image: icon)
        accessoryImageView.tintColor = Style.sharedInstance.foregroundColor
        cell.accessoryView = accessoryImageView
        
        return cell
    }
}

extension SimpleTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, willBeginCustomizingViewControllers viewControllers: [UIViewController]) {
        
        let subviews = tabBarController.view.subviews
        if subviews.count > 1  {
            let editView = subviews[1]
            editView.backgroundColor = Style.sharedInstance.backgroundColor
        }
    }
}
