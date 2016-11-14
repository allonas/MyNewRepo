//
//  UIView+Additions.swift
//  DemoNov
//
//  This App has been generated using IBM Mobile UI Builder
//

import UIKit

extension UIView {

    func setBackgroundImage(image: UIImage?) {

        guard let img = image else {
            return
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            let imageView = UIImageView(frame: CGRect.zero)
            imageView.image = img
            imageView.opaque = false
            imageView.clipsToBounds = true
            imageView.contentMode = .ScaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            self.insertSubview(imageView, atIndex: 0)
            
            let views = ["imageView": imageView];
            
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[imageView]|",
                options: .DirectionLeadingToTrailing,
                metrics: nil,
                views: views))
            
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[imageView]|",
                options: .DirectionLeadingToTrailing,
                metrics: nil,
                views: views))
        }
    }
    
    func setBackgroundView(view: UIView?) {
        
        guard let view = view else {
            return
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.insertSubview(view, atIndex: 0)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            let views = ["view": view];
            
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|",
                options: .DirectionLeadingToTrailing,
                metrics: nil,
                views: views))
            
            self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|",
                options: .DirectionLeadingToTrailing,
                metrics: nil,
                views: views))
        }
    }
}