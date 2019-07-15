//
//  Alert.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 14/06/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import UIKit


extension UIViewController{
    
    
    func addLogo(name : String){
        
        let logo = UIImage(named: "icon-star-logo-1")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    func pushIfRequired(className:AnyClass) {
        
        if (UIViewController.self != className) {
            print("Your pushed class must be child of UIViewController")
            return
        }
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var isPopDone = false
        let mainNavigation = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController
        let viewControllers = mainNavigation!.viewControllers
        for vc in viewControllers {
            if (type(of: vc) == className) {
                mainNavigation?.popToViewController(vc, animated: true)
                isPopDone =  true
                break
            }
        }
        if isPopDone == false{
            let instanceSignUp = storyboard.instantiateViewController(withIdentifier: NSStringFromClass(className)) // Identifier must be same name as class
            mainNavigation?.pushViewController(instanceSignUp, animated: true)
        }
    }
    
    func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func pushView(vc : UIViewController, animated:Bool = true )  {

       self.navigationController?.pushViewController(vc, animated: animated)
    }
    func hideBackButton(){
        self.navigationItem.hidesBackButton = true
    }
    func showBackButton(){
        self.navigationItem.hidesBackButton = false
    }
}




