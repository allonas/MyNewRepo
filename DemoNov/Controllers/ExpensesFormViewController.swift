//
//  ExpensesFormViewController.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//
import UIKit

class ExpensesFormViewController: FormViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

		AnalyticsManager.sharedInstance?.analytics?.logPage("")
		let item = self.item as? ExpensesDSItem
    
		let dataField0Field = IntegerField(name: ExpensesDSItemMapping.dataField0, label: "Id", required: false, value: item?.dataField0)
        contentView.addSubview(dataField0Field)
		
		let titleField = StringField(name: ExpensesDSItemMapping.title, label: "Title", required: false, value: item?.title)
        contentView.addSubview(titleField)
		
		let amountField = DecimalField(name: ExpensesDSItemMapping.amount, label: "Amount", required: false, value: item?.amount)
        contentView.addSubview(amountField)
		
		let dateField = DateField(name: ExpensesDSItemMapping.date, label: "Date", required: false, value: item?.date)
        contentView.addSubview(dateField)
		
		let categoryIdField = IntegerField(name: ExpensesDSItemMapping.categoryId, label: "", required: false, value: item?.categoryId)
        contentView.addSubview(categoryIdField)
		
       
        updateViewConstraints()
        
        retrieveFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

