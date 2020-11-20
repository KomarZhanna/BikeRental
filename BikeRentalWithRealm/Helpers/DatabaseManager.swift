//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Zhanna on 01.10.2020.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    public func userExists(with email:String, completion: @escaping((Bool)->Void) ) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
            
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
        
    }
    
    
    public func insertUser(with user:ChatAppUser) {
        
        database.child(user.safeEmail).setValue([
            "user_name":user.name
        ])
        
    }
    
    struct ChatAppUser {
        let name:String
        let emailAddress:String
        
        var safeEmail:String {
            var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            return safeEmail
        }
        // let pictureProfile:String
    }
}
