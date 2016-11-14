//
//  Item.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

public protocol Item {
    
    var identifier:AnyObject? { get }
    
    init?(dictionary: NSDictionary?)
    
    func retrieve(dictionary: NSDictionary?)
}