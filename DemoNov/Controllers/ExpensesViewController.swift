//
//  ExpensesViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class ExpensesViewController: TableViewController<ExpensesDSItem>, UITableViewDataSource, UITableViewDelegate {
    
    typealias Cell = DetailCell

	var categoriesDSItem: CategoriesDSItem?
    
    override init() {
        super.init()
		
		datasource = DatasourceManager.sharedInstance.ExpensesDS
		dataResponse = self	
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnalyticsManager.sharedInstance?.analytics?.logPage("Expenses")
       
	    navigationItem.title = NSLocalizedString("Expenses", comment: "")
	
		let sortOptions = DatasourceSortOptions(field: ExpensesDSItemMapping.date, ascending: false)
        datasourceOptions = DatasourceOptions(sortOptions: sortOptions)
        datasourceOptions.addDesignFilter(datasource?.datasourceFilter.create(ExpensesDSItemMapping.categoryId, number: categoriesDSItem?.dataField0))
			

        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(Cell.self, forCellReuseIdentifier: Cell.identifier)
		behaviors.append(CreateBehavior<ExpensesFormViewController, ExpensesDSItem>(viewController: self))

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
		cell.titleLabel.text = String(format: "$%@ ", String(double: item.amount))
		cell.detailLabel.text = String(format: "%@ on %@", item.title ?? "", String(date: item.date))
		
		// Styles

		cell.titleLabel.font = Style.sharedInstance.font(Fonts.Sizes.large, bold: false, italic: false)
	
		cell.detailLabel.font = Style.sharedInstance.font(Fonts.Sizes.small, bold: false, italic: true)
		cell.detailLabel.textColor = UIColor(rgb: 0x757575)
			
		return cell
    }

	 //MARK: - <UITableViewDelegate>
	 
	
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let destinationViewController = ExpensesDetailViewController()
        destinationViewController.item = items[indexPath.row]
	        
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

extension ExpensesViewController: DataResponse {

    func success() {
        
        tableView.reloadData()
    }
    
    func failure(error: NSError?) {
        
        ErrorManager.show(error, rootController: self)
    }
}

