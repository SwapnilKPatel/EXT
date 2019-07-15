//
//  UIImageExt.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 15/07/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        
        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
