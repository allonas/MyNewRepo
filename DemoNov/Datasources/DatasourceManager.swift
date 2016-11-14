//
//  DatasourceManager.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class DatasourceManager {

	static let sharedInstance = DatasourceManager()
	
	lazy var EmptyDatasource: LocalDatasource<Item1> = {
    
        return LocalDatasource<Item1>(resource: DatasourceConfig.Local.EmptyDatasource.resource) 
    }()
	
	
	lazy var ExpensesDS: CloudDatasource<ExpensesDSItem> = {
    
        return CloudDatasource<ExpensesDSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.ExpensesDS.resource,
                                             apikey: DatasourceConfig.Cloud.ExpensesDS.apiKey,
                                             searchableFields: [ExpensesDSItemMapping.title]) 
    }()
	
	lazy var CategoriesDS: CloudDatasource<CategoriesDSItem> = {
    
        return CloudDatasource<CategoriesDSItem>(baseUrl: DatasourceConfig.Cloud.baseUrl,
                                             resource: DatasourceConfig.Cloud.CategoriesDS.resource,
                                             apikey: DatasourceConfig.Cloud.CategoriesDS.apiKey,
                                             searchableFields: [CategoriesDSItemMapping.title, CategoriesDSItemMapping.dataField1]) 
    }()
	
}

