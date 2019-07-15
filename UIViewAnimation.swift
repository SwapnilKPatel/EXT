//
//  UIViewAnimation.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 14/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import UIKit
extension UIView{
    
    /// Fade in view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 0.35 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil)
    func fadeIn(duration: TimeInterval = 0.25, completion: ((Bool) -> Void)? = nil) {
        guard isHidden || alpha < 1 else { completion?(true); return }
        
        let originalAlpha = alpha
        
        if isHidden {
            alpha = 0
        }
        
        UIView.animate(
            withDuration: duration,
            animations: {
                self.isHidden = false
                self.alpha = originalAlpha
        },
            completion: completion
        )
    }
    
    /// Fade out view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 0.35 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil)
    func fadeOut(duration: TimeInterval = 0.25, completion: ((Bool) -> Void)? = nil) {
        guard !isHidden || alpha > 0 else { completion?(true); return }
        
        let originalAlpha = alpha
        
        UIView.animate(
            withDuration: duration,
            animations: {
                self.alpha = 0
        },
            completion:  {
                self.isHidden = true
                self.alpha = originalAlpha
                completion?($0)
        }
        )
    }
    
}
extension UIView
{
    func makeVertical()
    {
        transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
}
