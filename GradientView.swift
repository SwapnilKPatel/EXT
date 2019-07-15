//
//  GradientView.swift
//  Photo Editor
//
//  Created by Ravi Chokshi on 4/11/17.
//  Copyright © 2017 Ravi Chokshi. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable public var gradientFromtop: Bool = true
    
    var gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        if gradientFromtop == false {
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.5).cgColor]
        } else {
            gradientLayer.colors = [ UIColor(red: 76.0/255, green: 179.0/255, blue: 122.0/255, alpha: 1.0).cgColor, UIColor(red: 38.0/255, green: 90.0/255, blue: 61.0/255 , alpha: 1.0).cgColor]
        }
//rgba(38,90,61,1) 0%, rgba(76,179,122,1)
        gradientLayer.locations = [NSNumber(value: 0.0 as Float), NSNumber(value: 1.0 as Float)]
        backgroundColor = UIColor.clear
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}
