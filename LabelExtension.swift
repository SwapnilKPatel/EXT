//
//  LabelExtension.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 18/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation
import UIKit

    class PaddingLabel: UILabel {
        
        var textInsets = UIEdgeInsets.zero {
            didSet { invalidateIntrinsicContentSize() }
        }
        
        override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
            let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
            let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                              left: -textInsets.left,
                                              bottom: -textInsets.bottom,
                                              right: -textInsets.right)
            return textRect.inset(by: invertedInsets)
        }
        
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: textInsets))
        } 
}

