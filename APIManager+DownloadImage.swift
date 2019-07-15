//
//  APIManager+DownloadImage.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 20/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation
import  UIKit
extension APIManager {
    /// Downloads a file asynchronously
    func loadFileAsync(url: URL, path :URL ,completion: @escaping (Bool) -> Void) {
        
        // create your document folder url
        // let documentsUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        // your destination file url
        let destination = path.appendingPathComponent(url.lastPathComponent)
        // print(destination.path)
        // log.info(m: "downloading file from URL: \(url.absoluteString)")
        if FileManager().fileExists(atPath: destination.path) {
            //print("The file already exists at path, deleting and replacing with latest")
            print("The file already exists at path")
            completion(true)
            //            if FileManager().isDeletableFile(atPath: destination.path){
            //                do{
            //                    try FileManager().removeItem(at: destination)
            //                    print("previous file deleted")
            //                    self.saveFile(url: url, destination: destination) { (complete) in
            //                        if complete{
            //                            completion(true)
            //                        }else{
            //                            completion(false)
            //                        }
            //                    }
            //                }catch{
            //                    print("current file could not be deleted")
            //                }
            //            }
            // download the data from your url
        }else{
            activityStartAnimating()
            self.saveFile(url: url, destination: destination) { (complete) in
                self.activityStopAnimating()
                if complete{
                    
                    completion(true)
                }else{
                    completion(false)
                }
            }
        }
    }
    
    
    func saveFile(url: URL, destination: URL, completion: @escaping (Bool) -> Void){
        
        URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) in
            // after downloading your data you need to save it to your destination url
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let location = location, error == nil
                else { print("error with the url response");
                    
                    completion(false); return}
            do {
                try FileManager.default.moveItem(at: location, to: destination)
                print("new file saved")
                
                completion(true)
            } catch {
                
                print("file could not be saved: \(error)")
                completion(false)
            }
        }).resume()
    }
    func saveImageDocumentDirectory(image: UIImage, imageName: String) {
        let fileManager = FileManager.default
        let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(LOCAL_SAVED_IMG)
        if !fileManager.fileExists(atPath: path) {
            try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let url = NSURL(string: path)
        let imagePath = url!.appendingPathComponent(imageName)
        let urlString: String = imagePath!.absoluteString
        let imageData = image.jpegData(compressionQuality: 0.75)
        //let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil)
    }
}
