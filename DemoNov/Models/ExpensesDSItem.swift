//
//  ExpensesDSItem.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

enum ExpensesDSItemMapping {
	static let dataField0 = "dataField0"
	static let title = "title"
	static let amount = "amount"
	static let date = "date"
	static let categoryId = "categoryId"
	static let id = "id"
}

public class ExpensesDSItem : Item {
	
	var dataField0 : Int?
	var title : String?
	var amount : Double?
	var date : NSDate?
	var categoryId : Int?
	var id : String?
	
	// MAR: - <Item>

	public var identifier: AnyObject? {
		guard let identifier = id else {
			return ""
		}
		return identifier
	}
	
	required public init?(dictionary: NSDictionary?) {
    
        retrieve(dictionary)
    }
	
	public func retrieve(dictionary: NSDictionary?) {
     
        guard let dic = dictionary else {
            return
        }
        
 		dataField0 = dic[ExpensesDSItemMapping.dataField0] as? Int
		
		title = dic[ExpensesDSItemMapping.title] as? String
		
		amount = dic[ExpensesDSItemMapping.amount] as? Double
		
		date = NSDate.date(dic[ExpensesDSItemMapping.date] as? String)
		
		categoryId = dic[ExpensesDSItemMapping.categoryId] as? Int
		
		id = dic[ExpensesDSItemMapping.id] as? String
		
	   
    }
}
	

