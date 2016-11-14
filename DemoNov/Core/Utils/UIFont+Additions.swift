//
//  FontHelper.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

extension UIFont {

    convenience init(familyName: String, size: CGFloat, bold: Bool, italic: Bool) {
        
        let descriptor = UIFontDescriptor(fontAttributes: [
            UIFontDescriptorFamilyAttribute: familyName,
            UIFontDescriptorNameAttribute: (bold && italic ? "Bold Italic" : (bold ? "Bold" : (italic ? "Italic" : "Regular")))
            ])
        
        self.init(descriptor: descriptor, size: size)
    }
    
    convenience init(familyName: String, size: CGFloat) {
    
        self.init(familyName: familyName, size: size, bold: false, italic: false)
    }
}