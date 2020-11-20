//
//  Shops.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 02.11.2020.
//

import Foundation

import RealmSwift

class Shops: Object{
  @objc dynamic var shopID: String = UUID().uuidString
   @objc  dynamic var name = ""
    @objc  dynamic var address = ""
    @objc dynamic var phoneNumber = ""
    @objc dynamic var email = ""
        
    override static func primaryKey() -> String? {
        return "shopID"
    }
}
