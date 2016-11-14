//
//  UIViewController+Additions.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

extension UIViewController {

    func addBottomItem(item: UIBarButtonItem, animated: Bool) {
    
        var buttons: [UIBarButtonItem] = []
        if let toolbarItems = toolbarItems {
            buttons.appendContentsOf(toolbarItems)
        }
        let flexibleBarButtonItem = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        buttons.append(flexibleBarButtonItem)
        buttons.append(item)
        buttons.append(flexibleBarButtonItem)
        setToolbarItems(buttons, animated: animated)
    }
}