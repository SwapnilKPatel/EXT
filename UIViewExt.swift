//
//  UIViewExt.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 07/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation
import UIKit
class UIviewExt: UIView {
    
    
  
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.initialSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetup()
    }
    
    func initialSetup() {
        self.backgroundColor = .white
    }
    
    
}
