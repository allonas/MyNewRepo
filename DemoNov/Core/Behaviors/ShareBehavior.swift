//
//  ShareBehavior.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit
import SVProgressHUD

class ShareBehavior<T: Item>: NSObject, Behavior {

    var dataViewController: DataViewController<T>!
    
    var shareItem: UIBarButtonItem!
    
    var items: [String] {
        
        var items: [String] = []
        if let title = dataViewController.title {
            items.append(title)
        }
        for view in dataViewController.contentView.subviews where view is UILabel {
            if let text = (view as! UILabel).text {
                items.append(text)
            }
        }
        return items
    }
    
    init(dataViewController: DataViewController<T>) {
        super.init()
        self.dataViewController = dataViewController
    }
    
    func load() {
        
        shareItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareAction))
        if dataViewController.navigationItem.rightBarButtonItems == nil {
            dataViewController.navigationItem.rightBarButtonItems = []
        }
        dataViewController.navigationItem.rightBarButtonItems?.append(shareItem)
    }
    
    func shareAction() {
        
        let itemsToShare = items
        if itemsToShare.count != 0 {
        
            let activityController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
            if let popoverPresentationController = activityController.popoverPresentationController {
                popoverPresentationController.barButtonItem = shareItem
                popoverPresentationController.permittedArrowDirections = .Any
            }
            dataViewController.presentViewController(activityController, animated: true, completion: nil)
            
        } else {
            
            SVProgressHUD.showInfoWithStatus(NSLocalizedString("No info to share", comment: ""))
        }
    }
}
        