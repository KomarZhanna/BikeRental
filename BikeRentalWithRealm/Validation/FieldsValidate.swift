//
//  FieldsValidate.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 05.11.2020.
//

import Foundation
import UIKit

class FieldsValidate {

   public func isValidPhoneNumber(phoneNumber: String) -> Bool{
        let regex = try? NSRegularExpression(pattern: "^\\+?3?8?\\(?0[0-9]{2}\\)?-?[0-9]{3}-?[0-9]{2}-?[0-9]{2}", options: NSRegularExpression.Options.caseInsensitive)

        let isMatch = regex?.matches(in: phoneNumber, options: [], range: NSRange(location: 0, length: phoneNumber.utf16.count))
        
        if isMatch != nil{
            return true
        }
        else{
        print("number is not correct")
        return false
        }
    }
    
    
    func showAlert(title : String, message: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "OK",
                               style: UIAlertAction.Style.default,
                               handler: nil)
        
        alert.addAction(ok)
       
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true, completion: nil)
        
       // self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension UIApplication {

    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }
}
