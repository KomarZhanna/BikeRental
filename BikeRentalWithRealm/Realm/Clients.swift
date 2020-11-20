//
//  Clients.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 15.10.2020.
//

import Foundation
import RealmSwift

class Clients: Object{
  @objc dynamic var clientId: String = UUID().uuidString
   @objc  dynamic var name = ""
    @objc  dynamic var phone = ""
    @objc dynamic var passportNumber = ""
    @objc dynamic var dateOfRental: Date = Date()
    
    var formattedDate : String {
             let format = DateFormatter()
             format.dateFormat = "dd/MM/yyyy HH:mm"
             return format.string(from: dateOfRental)
          }
    
    
    override static func primaryKey() -> String? {
        return "clientId"
    }

}

//class ClientsList: Object {
//    dynamic var id:String = UUID().uuidString
//
////
////    override static func primaryKey() -> String? {
////        return "id"
////    }
//}
