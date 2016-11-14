//
//  ExpensesTrackerViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class ExpensesTrackerViewController: TableViewController<CategoriesDSItem>, UITableViewDataSource, UITableViewDelegate {
    
    typealias Cell = BasicImageCell

    
    override init() {
        super.init()
		
		datasource = DatasourceManager.sharedInstance.CategoriesDS
		dataResponse = self	
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnalyticsManager.sharedInstance?.analytics?.logPage("ExpensesTracker")
       
	    navigationItem.title = NSLocalizedString("Expenses Tracker", comment: "")
	
		let sortOptions = DatasourceSortOptions(field: CategoriesDSItemMapping.title, ascending: true)
        datasourceOptions = DatasourceOptions(sortOptions: sortOptions)
			

        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Cell.self, forCellReuseIdentifier: Cell.identifier)
		behaviors.append(CreateBehavior<ExpenseTrackerFormViewController, CategoriesDSItem>(viewController: self))

        for behavior in self.behaviors {
            behavior.load()
        }
			
		updateViewConstraints()

        loadData()					
    }
    
	//MARK: - <UITableViewDataSource>
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
	
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier(Cell.identifier, forIndexPath: indexPath) as! Cell

		// You can customize the accessory icon ...
        let icon = UIImage(named: Images.arrow)?.imageWithRenderingMode(.AlwaysTemplate)
        let accessoryImageView = UIImageView(image: icon)
        accessoryImageView.tintColor = Style.sharedInstance.foregroundColor
        cell.accessoryView = accessoryImageView
	
        // Binding 
        let item = items[indexPath.row]
			
        cell.photoImageView.loadImage(datasource.imagePath(item.icon))
		cell.titleLabel.text = item.title
		
		// Styles
		
		return cell
    }

	 //MARK: - <UITableViewDelegate>
	 
	
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let destinationViewController = ExpensesTrackerDetailViewController()
        destinationViewController.item = items[indexPath.row]
		destinationViewController.hidesBottomBarWhenPushed = true
	        
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
	
	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        loadMoreData(indexPath.row)
		
		cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
        cell.separatorInset = UIEdgeInsetsZero
    }
}

//MARK: - <DataResponse>

extension ExpensesTrackerViewController: DataResponse {

    func success() {
        
        tableView.reloadData()
    }
    
    func failure(error: NSError?) {
        
        ErrorManager.show(error, rootController: self)
    }
}

