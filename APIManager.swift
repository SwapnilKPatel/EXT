//
//  APIManager.swift
//  Weather
//
//  Created by Ravi Chokshi on 15/02/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import Foundation

import UIKit


class APIManager{
    public static let  sharedInstance = APIManager()
  
    
    func callLoginApi(url : String,completionHandler: ((User) -> Void)? = nil ){
          activityStartAnimating()
        URLSession.shared.dataTask(with: URL(string : url)!) { (data, response, error) in
            print("LOAD")
            if (error != nil){
                print(error?.localizedDescription ?? "NA")
            }else{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? JSONDictionary{
                     
                        if json["success"] as! Bool == true{
                        let decoder = JSONDecoder()
                        
                        do {
                            let user = try decoder.decode(User.self, from: data!)
                            
                            DispatchQueue.main.async {
                                // self.delegate?.didWeatherAvailable(weatherItems: weatherItems)
                                
                                if completionHandler != nil {
                                    self.activityStopAnimating()
                                    completionHandler!(user)
                                    return
                                }
                                
                            }
                        } catch {
                              self.activityStopAnimating()
                            print(error.localizedDescription)
                        }
                
                        
                        
                      
                
                       
                    }
                    
                    }
                }catch{
                 self.activityStopAnimating()
                }
            }
            }.resume()
        
    }
    
   

    
    
   

}
