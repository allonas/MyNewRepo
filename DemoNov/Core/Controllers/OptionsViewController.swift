//
//  OptionsViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

protocol OptionsDelegate {
    
    func selected(options: [String: String]?)
}

class OptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    var style:UITableViewStyle = .Plain
    
    var didSetupContraints = false
    
    var mainConstraints: [NSLayoutConstraint] = []
    
    var items: [String: String] = [:]
    
    var allItems: [String: String]!
    
    var optionsSelected: [String: String] = [:]
    
    var delegate: OptionsDelegate?
    
    var keys: [String] {
        return Array(items.keys).sort(<)
    }
    
    typealias Cell = BasicCell
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(style: UITableViewStyle) {
        super.init(nibName: nil, bundle: nil)
        self.style = style
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Select some options", comment: "")
        
        view.backgroundColor = Style.sharedInstance.backgroundColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done,
                                                            target: self,
                                                            action: #selector(doSelection))
        
        let searchBar = UISearchBar(frame: CGRectMake(0, 0, CGRectGetWidth(view.bounds), Dimens.Sizes.toolbar))
        searchBar.autoresizingMask = .FlexibleWidth
        searchBar.delegate = self
        
        allItems = items
        
        tableView = UITableView(frame: CGRect.zero, style: style)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = searchBar
        tableView.registerClass(Cell.self,
                                forCellReuseIdentifier: Cell.identifier)
        
        tableView.layoutMargins = UIEdgeInsetsZero
        if #available(iOS 9.0, *) {
            tableView.cellLayoutMarginsFollowReadableWidth = false
        }
        
        view.addSubview(tableView)
        
        updateViewConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        if !didSetupContraints {
            didSetupContraints = true
            setupConstraints()
        }
        super.updateViewConstraints()
    }
    
    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.removeConstraints(mainConstraints)
        mainConstraints.removeAll()
        
        let views:[String: AnyObject] = [
            "tableView" : tableView
        ]
        
        mainConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|",
            options: .DirectionLeadingToTrailing,
            metrics: nil,
            views: views))
        
        mainConstraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|",
            options: .DirectionLeadingToTrailing,
            metrics: nil,
            views: views))
        
        view.addConstraints(mainConstraints)
    }
    
    func configure(cell: Cell, indexPath: NSIndexPath) {
        
        let key = keys[indexPath.row]
        let value = items[key]
        cell.titleLabel.text = value
        
        if optionsSelected.indexForKey(key) != nil {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func doSelection() {
        
        delegate?.selected(optionsSelected)
        navigationController?.popViewControllerAnimated(true)
    }
    
    func search(text: String?) {
        
        view.endEditing(true)
        if let text = text {
            var filtered: [String: String] = [:]
            for (key, value) in allItems {
                let range = value.rangeOfString(text, options: .CaseInsensitiveSearch)
                if range != nil {
                    filtered[key] = value
                }
            }
            items = filtered
        } else {
            items = allItems
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.tableView.reloadData()
        }
    }
    
    //MARK: - <UITableViewDataSource>
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Cell.identifier,
                                                               forIndexPath: indexPath) as! Cell
        configure(cell, indexPath: indexPath)
        return cell
    }
    
    //MARK: - <UITableViewDelegate>
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let key = keys[indexPath.row]
        let value = items[key]
        if optionsSelected.indexForKey(key) != nil {
            optionsSelected.removeValueForKey(key)
        } else {
            optionsSelected[key] = value
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            tableView.beginUpdates()
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
            tableView.endUpdates()
        }
    }
}

// MARK: - <UISearchBarDelegate>

extension OptionsViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        if !searchBar.showsCancelButton {
            searchBar.setShowsCancelButton(true, animated: true)
        }
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        if searchBar.showsCancelButton {
            searchBar.setShowsCancelButton(false, animated: true)
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = nil
        search(nil)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let text = searchBar.text where !text.trim().isEmpty {
            search(text)
        } else {
            search(nil)
        }
    }
}
