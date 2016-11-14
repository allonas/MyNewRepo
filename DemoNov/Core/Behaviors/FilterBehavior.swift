//
//  FilterBehavior.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class FilterBehavior <T: FilterViewController>: NSObject, Behavior {
    
    var viewController: UIViewController!
    
    var filterViewController: FilterViewController!
    
    var dataDelegate: DataDelegate!
    
    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
        dataDelegate = viewController as? DataDelegate
    }
    
    func load() {
        
        if let dataDelegate = dataDelegate {
            
            filterViewController = T()
            filterViewController.title = viewController.title
            filterViewController.filterDelegate = self
            
            filterViewController.datasource = dataDelegate.datasource
            filterViewController.datasourceOptions = dataDelegate.datasourceOptions
            
            let button = UIBarButtonItem(image: UIImage(named: Images.filter), style: .Plain, target: self, action: #selector(openFilter))
            if viewController.navigationItem.rightBarButtonItems == nil {
                viewController.navigationItem.rightBarButtonItems = []
            }
            viewController.navigationItem.rightBarButtonItems?.append(button)
        }
    }
    
    func openFilter() {
        
        let navigationController = UINavigationController(rootViewController: filterViewController)
        viewController.presentViewController(navigationController, animated: true, completion: nil)
    }
}

extension FilterBehavior: FilterDelegate {
    
    func submit(filters: [Filter]?) {
        
        var datasourceOptions = dataDelegate.datasourceOptions
        if datasourceOptions == nil {
            datasourceOptions = DatasourceOptions()
        }
        if let filters = filters {
            datasourceOptions.filters = filters
        } else {
            datasourceOptions.filters.removeAll()
        }
        dataDelegate.datasourceOptions = datasourceOptions
        dataDelegate.clearData()
        dataDelegate.loadData()
    }
}