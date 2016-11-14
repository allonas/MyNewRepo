//
//  MailAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class MailAction: UriAction {

    let prefix = "mailto:"
    
    init(recipient: String? = nil, subject: String? = nil, body: String? = nil) {
    
        var actionUri = ""
        
        if let recipient = recipient?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            
            actionUri.appendContentsOf(recipient)
            actionUri.appendContentsOf("?")
        }
        
        if let subject = subject?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            
            actionUri.appendContentsOf("subject=")
            actionUri.appendContentsOf(subject)
            actionUri.appendContentsOf("&")
        }
        
        if let body = body?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            
            actionUri.appendContentsOf("body=")
            actionUri.appendContentsOf(body)
        }
        
        if actionUri.characters.count != 0 {
        
            super.init(uri: "\(prefix)\(actionUri)")
        
        } else {
        
            super.init(uri: nil)
        }
    }
}