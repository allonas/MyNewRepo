//
//  CategoriesDSItem.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

enum CategoriesDSItemMapping {
	static let dataField0 = "dataField0"
	static let title = "title"
	static let dataField1 = "dataField1"
	static let icon = "icon"
	static let id = "id"
}

public class CategoriesDSItem : Item {
	
	var dataField0 : Int?
	var title : String?
	var dataField1 : String?
	var icon : String?
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
        
 		dataField0 = dic[CategoriesDSItemMapping.dataField0] as? Int
		
		title = dic[CategoriesDSItemMapping.title] as? String
		
		dataField1 = dic[CategoriesDSItemMapping.dataField1] as? String
		
		icon = dic[CategoriesDSItemMapping.icon] as? String
		
		id = dic[CategoriesDSItemMapping.id] as? String
		
	   
    }
}
	

