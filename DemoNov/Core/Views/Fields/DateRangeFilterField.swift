//
//  DateRangeFilterField.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class DateRangeFilterField: DateRangeField {
    
    var datasource: Datasource!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(datasource: Datasource, name: String, label: String, value: AnyObject?) {
        super.init(name: name, label: label, required: false, value: value)
        self.datasource = datasource
    }
}

extension DateRangeFilterField: FilterField {
    
    func filter() -> Filter? {
        
        guard let value = value else {
            return nil
        }
        let dateRange = value as! DateRange
        return datasource.datasourceFilter.create(name, dateMin: dateRange.startDate, dateMax: dateRange.endDate)
    }
}