//
//  URLExt.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 15/07/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation
import UIKit
extension URL {
    
    func getFileNameFromUrl() -> String{
        
        let filename = self.lastPathComponent
        return filename
    }
}
extension URL {
    static var documentsDirectory: URL {
        let documentsDirectory2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return URL.init(string: documentsDirectory2)!
    }
    
    static func urlInDocumentsDirectory(with filename: String) -> URL {
        return documentsDirectory.appendingPathComponent(filename)
    }
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        guard let url = URL(string: value) else {
            fatalError("\(value) is an invalid url")
        }
        self = url
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}
/*
 if let url = "https://example.com".url {
 }
 
 let url: URL = "https://example.com"
 */
