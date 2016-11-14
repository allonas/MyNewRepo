//
//  WebBrowserAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class LinkAction: UriAction {
    
    let prefix = "http://"
    
    override init(uri: String? = nil) {
        
        guard let uri = uri where !uri.isEmpty else {
            
            super.init(uri: nil)
            return
        }
        
        var url = uri.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        if url != nil && !uri.containsString("://") {
            
            url = "\(prefix)\(url!)"
        }
        
        super.init(uri: url)
    }
}