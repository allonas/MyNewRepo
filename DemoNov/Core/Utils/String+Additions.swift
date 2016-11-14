//
//  String.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

extension String {

    init(string: String?) {
    
        guard let string = string else {
            self.init()
            return
        }
        
        self.init(string)
    }
    
    init(bool: Bool?) {
        
        guard let bool = bool else {
            self.init()
            return
        }
        
        self.init(bool)
    }
    
    init(int: Int?) {
        
        guard let int = int else {
            self.init()
            return
        }
        
        self.init(int)
    }
    
    init(double: Double?) {
        
        guard let double = double else {
            self.init()
            return
        }
        
        self.init(double)
    }
    
    init(date: NSDate?) {
        
        guard let date = date else {
            self.init()
            return
        }
        
        self.init(date.dateValue())
    }
    
    init(datetime: NSDate?) {
        
        guard let datetime = datetime else {
            self.init()
            return
        }
    
        self.init(datetime.datetimeValue())
    }
    
    init(geoPoint: GeoPoint?) {
    
        guard let geoPoint = geoPoint else {
            self.init()
            return
        }
        
        self.init(geoPoint.stringValue())
    }
    
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}