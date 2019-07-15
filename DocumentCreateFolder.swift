//
//  File.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 20/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//



import UIKit



import Foundation

extension URL {
    static func createFolder(folderName: String) -> URL? {
        let fileManager = FileManager.default
        // Get document directory for device, this should succeed
        if let documentDirectory = fileManager.urls(for: .documentDirectory,
                                                    in: .userDomainMask).first {
            // Construct a URL with desired folder name
            let folderURL = documentDirectory.appendingPathComponent(folderName)
            // If folder URL does not exist, create it
            if !fileManager.fileExists(atPath: folderURL.path) {
                do {
                    // Attempt to create folder
                    try fileManager.createDirectory(atPath: folderURL.path,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)
                } catch {
                    // Creation failed. Print error & return nil
                    print(error.localizedDescription)
                    return nil
                }
            }
            // Folder either exists, or was created. Return URL
            return folderURL
        }
        // Will only be called if document directory not found
        return nil
    }
}
//MrNightFox
// get file list from sub dir
extension FileManager {
    func getSubDirectoryUrls(for directory: FileManager.SearchPathDirectory,subDirectory : String, skipsHiddenFiles: Bool = true ) -> [URL]? {
        
        do {
            let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let Path1 = documentURL.appendingPathComponent(subDirectory).absoluteURL
            let directoryContents = try FileManager.default.contentsOfDirectory(at: Path1, includingPropertiesForKeys: nil, options: [])
            print(directoryContents)
            return directoryContents
        }
        catch {
            print(error.localizedDescription)
            return [URL]()
        }
    }
}
