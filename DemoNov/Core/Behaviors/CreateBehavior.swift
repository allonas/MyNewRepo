//
//  CreateBehavior.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit
import SVProgressHUD

class CreateBehavior<U: FormViewController, T:Item>: NSObject, Behavior {

    var viewController: UIViewController!
    
    var formViewController: FormViewController!
    
    var dataDelegate: DataDelegate!
 
    var crudService: CRUD!
    
    var syncService: DatasouceSync!
    
    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
        dataDelegate = viewController as? DataDelegate
        crudService = dataDelegate?.datasource as? CRUD
        syncService = dataDelegate?.datasource as? DatasouceSync
    }
    
    func load() {
        
        if let crudService = crudService {
            
            formViewController = U()
            formViewController.title = viewController.title
            formViewController.formDelegate = self
            
            formViewController.crudService = crudService
            
            let button = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(openForm))
            if viewController.navigationItem.rightBarButtonItems == nil {
                viewController.navigationItem.rightBarButtonItems = []
            }
            viewController.navigationItem.rightBarButtonItems?.append(button)
        }
    }
    
    func openForm() {
        let navigationController = UINavigationController(rootViewController: formViewController)
        viewController.presentViewController(navigationController, animated: true, completion: nil)
    }
}

extension CreateBehavior: FormDelegate {

    func submit(fields: [String : AnyObject]?) {
        
        formViewController.clear()
        formViewController.formValues.removeAll()
        if let fields = fields {
        
            SVProgressHUD.show()
            
            crudService.create(fields, success: { [weak self] (response: T?) in
                
                guard let strongSelf = self else { return }
                
                SVProgressHUD.showSuccessWithStatus(nil)
                strongSelf.dataDelegate.clearData()
                strongSelf.dataDelegate.loadData()
                
                if let syncService = strongSelf.syncService {
                    syncService.sync()
                }
                
            }) { [weak self] (error) in
            
                SVProgressHUD.dismiss()
                guard let strongSelf = self else { return }
                
                ErrorManager.show(error, rootController: strongSelf.viewController)
            }
        }
    }
}
