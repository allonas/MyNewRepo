//
//  LoginResponse.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

enum LoginResponseMapping {
    
    static let token = "token"
    static let expirationTime = "expirationTime"
}

public class LoginResponse : Item {
    
    var token: String?
    var expirationTime: Double?
    
    // MAR: - <Item>
    
    public var identifier: AnyObject? {
        return token
    }
    
    required public init?(dictionary: NSDictionary?) {
        
        retrieve(dictionary)
    }
    
    public func retrieve(dictionary: NSDictionary?) {
        
        guard let dic = dictionary else {
            return
        }
        
        token = dic[LoginResponseMapping.token] as? String
        
        expirationTime = dic[LoginResponseMapping.expirationTime] as? Double
    }
}