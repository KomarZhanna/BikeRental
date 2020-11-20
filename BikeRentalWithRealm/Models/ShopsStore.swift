//
//  ShopsStore.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 02.11.2020.
//

import Foundation
import RealmSwift


//enum RuntimeError: Error {
//    case NoRealmSet
//}

class ShopsStore{
    
    var realm: Realm? = try! Realm()
    
    func printURL(){
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func errorHandle() throws{
        throw RuntimeError.NoRealmSet
    }
    
    public func saveClient(_ client:Clients){
        
        if (realm != nil) {
                    try! realm!.write {
                        realm!.add(client)
                    }
                }
        else {
            try! errorHandle()
            }
    
    }
    
    
    public func fetchAllShops() -> Results<Shops>?{
        let results = realm?.objects(Shops.self)
        return results!
    }
    
//    public func findClientByName(_ name:String) -> Results<Clients> {
//        if (realm != nil) {
//            let predicate = NSPredicate(format: "name = %@", name)
//            return realm!.objects(Clients.self).filter(predicate)
//        } else {
//            try! errorHandle()
//        }
//    }
    
    public func deleteShop(_ shop:Shops){
        do {
            try! realm?.write {
                realm?.delete(shop)
                
              }
          } catch let error as NSError {
              // handle error
              print("error - \(error.localizedDescription)")
          }
    }
    
    
    public func createNewShop(_ name:String, address:String, phone: String, email: String) -> Shops {
        let newShop = Shops()
        newShop.name = name
        newShop.phoneNumber = phone
        newShop.address = address
        newShop.email = email
        return newShop
    }
    
    
    
    public func updateShop(_ name:String, address:String, phone: String, email: String) -> Shops{
        let updatedShop = Shops()
        updatedShop.name = name
        updatedShop.phoneNumber = phone
        updatedShop.address = address
        updatedShop.email = email
        
        try! realm?.write {
            realm?.add(updatedShop, update: .modified)
            }
        return updatedShop
   
    }
}
