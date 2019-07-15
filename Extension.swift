//
//  Extaintions.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 16/05/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation
import UIKit
import SwiftyUserDefaults

extension DefaultsKeys {
    static let isLogin = DefaultsKey<Bool?>("isLogin", defaultValue: false)
    static let launchCount = DefaultsKey<Int>("launchCount", defaultValue: 0)
}

