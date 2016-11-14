//
//  ExpenseTrackerFormViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//
import UIKit

class ExpenseTrackerFormViewController: FormViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("")
		let item = self.item as? CategoriesDSItem
    
		let dataField0Field = IntegerField(name: CategoriesDSItemMapping.dataField0, label: "Id", required: false, value: item?.dataField0)
        contentView.addSubview(dataField0Field)
		
		let titleField = StringField(name: CategoriesDSItemMapping.title, label: "Title", required: false, value: item?.title)
        contentView.addSubview(titleField)
		
		let dataField1Field = StringField(name: CategoriesDSItemMapping.dataField1, label: "Description", required: false, value: item?.dataField1)
        contentView.addSubview(dataField1Field)
		
		let iconField = ImageField(name: CategoriesDSItemMapping.icon, label: "Icon", required: false, viewController: self, value: crudService?.imagePath(item?.icon))
        contentView.addSubview(iconField)
		
       
        updateViewConstraints()
        
        retrieveFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

