//
//  Field.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

protocol Field {
    
    var name: String! { get }
    var value: AnyObject? { get set }
    
    func clear()
    func reset()
    func valid() -> Bool
    func jsonValue() -> AnyObject?
}

