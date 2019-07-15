//
//  ActivityIndicator.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 14/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import UIKit
import SVProgressHUD
extension UIViewController{
//    func shared() -> AppDelegate {
//        let appDel = UIApplication.shared.delegate as? AppDelegate
//        return appDel!
//    }
//    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
//        let backgroundView = UIView()
//        let shadowView = UIView()
//        backgroundView.frame = CGRect.init(x: (SCREEN_WIDTH/2) - 40, y: (SCREEN_HEIGHT/2) - 40, width: 80, height: 80)
//        backgroundView.cornerRadius = 3
//        shadowView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
//        shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
//        //backgroundView.center = self.view.center
//        backgroundView.backgroundColor = backgroundColor
//        shadowView.tag = 475647
//
//        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
//        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
//
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = UIActivityIndicatorView.Style.gray
//        activityIndicator.color = activityColor
//        activityIndicator.startAnimating()
//        //self.view.isUserInteractionEnabled = false
//
//        backgroundView.addSubview(activityIndicator)
//
//        shadowView.addSubview(backgroundView)
//        shared().window?.addSubview(shadowView)
//
//    }
    
//    func activityStopAnimating() {
//        if let shadowView = shared().window?.viewWithTag(475647){
//            shadowView.removeFromSuperview()
//        }
//
//}
    func shared() -> AppDelegate {
        let appDel = UIApplication.shared.delegate as? AppDelegate
        return appDel!
    }
    func activityStartAnimating() {
        //        let backgroundView = UIView()
        //        let shadowView = UIView()
        //        backgroundView.frame = CGRect.init(x: (SCREEN_WIDTH/2) - 40, y: (SCREEN_HEIGHT/2) - 40, width: 80, height: 80)
        //        backgroundView.cornerRadius = 3
        //        shadowView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        //        shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        //        //backgroundView.center = self.view.center
        //        backgroundView.backgroundColor = backgroundColor
        //        shadowView.tag = 475647
        //
        //        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        //        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        //
        //        activityIndicator.hidesWhenStopped = true
        //        activityIndicator.style = UIActivityIndicatorView.Style.gray
        //        activityIndicator.color = activityColor
        //        activityIndicator.startAnimating()
        //        //self.view.isUserInteractionEnabled = false
        //
        //        backgroundView.addSubview(activityIndicator)
        //
        //        shadowView.addSubview(backgroundView)
        //        shared().window?.addSubview(shadowView)
        
        SVProgressHUD.show()
        
    }
    
    func activityStopAnimating() {
        //        if let shadowView = shared().window?.viewWithTag(475647){
        //            shadowView.removeFromSuperview()
        //        }
        SVProgressHUD.dismiss()
        
    }
}
extension APIManager{
    func shared() -> AppDelegate {
        let appDel = UIApplication.shared.delegate as? AppDelegate
        return appDel!
    }
    func activityStartAnimating() {
//        let backgroundView = UIView()
//        let shadowView = UIView()
//        backgroundView.frame = CGRect.init(x: (SCREEN_WIDTH/2) - 40, y: (SCREEN_HEIGHT/2) - 40, width: 80, height: 80)
//        backgroundView.cornerRadius = 3
//        shadowView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
//        shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
//        //backgroundView.center = self.view.center
//        backgroundView.backgroundColor = backgroundColor
//        shadowView.tag = 475647
//
//        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
//        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
//
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = UIActivityIndicatorView.Style.gray
//        activityIndicator.color = activityColor
//        activityIndicator.startAnimating()
//        //self.view.isUserInteractionEnabled = false
//
//        backgroundView.addSubview(activityIndicator)
//
//        shadowView.addSubview(backgroundView)
//        shared().window?.addSubview(shadowView)
        
       SVProgressHUD.show()
        
    }
    
    func activityStopAnimating() {
//        if let shadowView = shared().window?.viewWithTag(475647){
//            shadowView.removeFromSuperview()
//        }
        SVProgressHUD.dismiss()
        
    }
}
extension String {
    
    var length: Int {
        return self.count
    }
    
    subscript (i: Int) -> String {
        return self[i..<i + 1]
    }
    
    func substring(from: Int) -> String {
        return self[min(from, length)..<length]
    }
    
    func substring(to: Int) -> String {
        return self[0..<max(0, to)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat
    {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
extension UILabel
{
   
    var optimalHeight : CGFloat
    {
        get
        {
            let label = UILabel(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = self.lineBreakMode
            label.font = self.font
            label.text = self.text
            label.font = UIFont.systemFont(ofSize: 17)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.sizeToFit()
            
            return label.frame.height
        }
    }
}
extension Date {
    
    func getElapsedInterval() -> String {
        
        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" :
                "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" :
                "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" :
                "\(day)" + " " + "days ago"
        } else {
            return "a moment ago"
            
        }
        
    }
}
extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
}

extension Date {
    
    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let strMonth = dateFormatter.string(from: self)
        
        return strMonth
    }
}
extension UserDefaults {
    
    func save<T:Encodable>(customObject object: T, inKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            self.set(encoded, forKey: key)
        }
    }
    
    func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
        if let data = self.data(forKey: key) {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(type, from: data) {
                return object
            }else {
                print("Couldnt decode object")
                return nil
            }
        }else {
            print("Couldnt find key")
            return nil
        }
    }
    
}
