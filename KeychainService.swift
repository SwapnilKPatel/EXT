//
//  KeychainService.swift
//  Phonex
//
//  Created by Ravi Chokshi on 27/02/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import UIKit

import Security

let kSecClassValue = NSString(format: kSecClass)
let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
let kSecValueDataValue = NSString(format: kSecValueData)
let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
let kSecAttrServiceValue = NSString(format: kSecAttrService)
let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
let kSecReturnDataValue = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)

let uniqueServiceName = "phoneboxService"
let uniqueAccessGroup = "phoneboxAccessGroup"
/*
 KeychainService.saveStringToKeychain(stringValue: (UIDevice.current.identifierForVendor?.uuidString)!, stringKey: Constants.STR_KEYCHAIN_DEVICE_ID)
 self.appDel!.deviceId =   KeychainService.getStringFromKeychain(stringKey:  Constants.STR_KEYCHAIN_DEVICE_ID)
 */
public class KeychainService: NSObject {
    
   // @available(iOS 11.3, *)
    
    static func saveStringToKeychain(stringValue: String, stringKey: String)
    {
       // let saveSuccessful: Bool = customKeychainWrapperInstance.set(stringValue, forKey: stringKey)
        
       // print("saveSuccessful === \(saveSuccessful)")
        
        self.savePassword(service: stringKey, account: uniqueAccessGroup, data: stringValue)
        
        print("saved \(stringKey) === \(self.loadPassword(service: stringKey, account: uniqueAccessGroup) ?? "")")
        
        
        
    }
    
    static func updateStringToKeychain(stringValue: String, stringKey: String)
    {
        
        self.updatePassword(service: stringKey, account: uniqueAccessGroup, data: stringValue)
        
        print("Updated \(stringKey) === \(self.loadPassword(service: stringKey, account: uniqueAccessGroup) ?? "")")
        
        
        
    }
    static func getStringFromKeychain(stringKey: String) -> String
    {
        return self.loadPassword(service: stringKey, account: uniqueAccessGroup)!
        
    }
    
    static func removeStringFromKeychain(stringKey: String)
    {
        self.removePassword(service: stringKey, account: uniqueAccessGroup)
        
    }
    
    //@available(iOS 11.3, *)
    class func updatePassword(service: String, account:String, data: String) {
        if let dataFromString: Data = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            // Instantiate a new default keychain query
            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue])
            
            let status = SecItemUpdate(keychainQuery as CFDictionary, [kSecValueDataValue:dataFromString] as CFDictionary)
            
            if (status != errSecSuccess) {
                if #available(iOS 11.3, *) {
                    if let err = SecCopyErrorMessageString(status, nil) {
                        print("Read failed: \(err)")
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
    
    //@available(iOS 11.3, *)
    class func removePassword(service: String, account:String) {
        
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue])
        
        // Delete any existing items
        let status = SecItemDelete(keychainQuery as CFDictionary)
        if (status != errSecSuccess) {
            if #available(iOS 11.3, *) {
                if let err = SecCopyErrorMessageString(status, nil) {
                    print("Remove failed: \(err)")
                }
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    
    
    //@available(iOS 11.3, *)
    class func savePassword(service: String, account:String, data: String) {
        if let dataFromString = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            // Instantiate a new default keychain query
            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, dataFromString], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecValueDataValue])
            
            // Add the new keychain item
            let status = SecItemAdd(keychainQuery as CFDictionary, nil)
            
            if (status != errSecSuccess) {    // Always check the status
                if #available(iOS 11.3, *) {
                    if let err = SecCopyErrorMessageString(status, nil) {
                        print("Write failed: \(err)")
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
    class func loadPassword(service: String, account:String) -> String? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
        
        var dataTypeRef :AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        var contentsOfKeychain: String?
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
            
            contentsOfKeychain = ""
        }
        
        return contentsOfKeychain
    }

}
