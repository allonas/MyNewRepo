//
//  MenuItem.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

struct MenuItem {

    var image: String?
    var text: String?
    var textStyle: TextStyle?
    var action: Action?
    
    init(image: String? = nil, text: String? = nil, action: Action? = nil, textStyle:TextStyle? = nil) {

        var style = textStyle
        if style == nil {
            style = TextStyle()
            style!.font = style!.font.fontWithSize(Fonts.Sizes.small)
        }
        self.image = image
        self.text = text
        self.textStyle = style
        self.action = action
    }
}