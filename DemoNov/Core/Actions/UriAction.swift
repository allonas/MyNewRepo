//
//  UriAction.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

class UriAction: Action {

    var uri: String?
    
    init(uri: String? = nil) {
    
        self.uri = uri
    }

    func execute() {
        
        if let uri = uri,
            let url = NSURL.init(string: uri) {
            
            AnalyticsManager.sharedInstance?.analytics?.logAction("open URI", target: uri)
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func canBeExecuted() -> Bool {
        
        guard let uri = uri where !uri.isEmpty else {
            
            return false
        }
        
        if let url = NSURL.init(string: uri) {
            return UIApplication.sharedApplication().canOpenURL(url)
        }
        return false
    }
}