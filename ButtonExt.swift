//
//  ButtonExt.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 15/07/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation

import UIKit

extension UIButton {
    
    func setImageTintColor(imageName:String , tintColor : UIColor ){
        
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: .normal)
        self.tintColor = tintColor
    }
    
}
