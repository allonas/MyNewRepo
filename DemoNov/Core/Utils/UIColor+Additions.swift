//
//  Color+Helper.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

extension UIColor {
    
    convenience init(rgb: Int, alpha: CGFloat) {
        
        let r = CGFloat((rgb & 0xFF0000) >> 16)/255
        let g = CGFloat((rgb & 0xFF00) >> 8)/255
        let b = CGFloat(rgb & 0xFF)/255
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(rgb: Int) {
        
        self.init(rgb:rgb, alpha:1.0)
    }
    
    static func random() -> UIColor {
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}