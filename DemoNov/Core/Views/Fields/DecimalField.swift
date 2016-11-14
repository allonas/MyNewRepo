//
//  DecimalField.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class DecimalField: StringField {
    
    override init(name: String, label: String, required: Bool = false, value: AnyObject? = nil) {
        super.init(name: name, label: label, required: required, value: value)
        
        rules.append(DecimalRule())
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
            return Double(value)
        } else if let value = value as? Double {
            return value
        }
        return nil
    }
}