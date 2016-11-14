//
//  DateTimeField.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class DateTimeField: DateField {

    override init(name: String, label: String, required: Bool = false, value: AnyObject? = NSDate()) {
        super.init(name: name, label: label, required: required, value: value)
        
        formatter.timeStyle = .ShortStyle
        
        datePicker.datePickerMode = .DateAndTime
        
        if let value = value as? NSDate {
            field.text = formatter.stringFromDate(value)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}