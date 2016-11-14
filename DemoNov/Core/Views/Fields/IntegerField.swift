//
//  IntegerField.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class IntegerField: StringField {
    
    override init(name: String, label: String, required: Bool = false, value: AnyObject? = nil) {
        super.init(name: name, label: label, required: required, value: value)
        
        rules.append(IntegerRule())
        field.keyboardType = .NumbersAndPunctuation
        reset()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func reset() {
        field.text = nil
        if let value = value {
            field.text = String(value)
        }
        errorLabel?.text = nil
    }
    
    override func jsonValue() -> AnyObject? {
        if let value = value as? String {
            return Int(value)
        } else if let value = value as? Int {
            return value
        }
        return nil
    }
}