//
//  ClientsStore.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 15.10.2020.
//

import Foundation
import RealmSwift


enum RuntimeError: Error {
    case NoRealmSet
}

class ClientsStore{
    
    var realm: Realm? = try! Realm()
    var validate = FieldsValidate()
    
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
    
    
    public func fetchAllClients() -> Results<Clients>?{
        let results = realm?.objects(Clients.self)
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
    
    public func deleteClient(_ client:Clients){
        do {
            try! realm?.write {
                realm?.delete(client)
                
              }
          } catch let error as NSError {
              // handle error
              print("error - \(error.localizedDescription)")
          }
    }
    
    
    
    
    public func createNewClient(_ name:String, phone:String, passport: String, dateOfRental: Date) -> Clients {
        let newClient = Clients()
        newClient.name = name
        newClient.phone = phone
        newClient.passportNumber = passport
        newClient.dateOfRental = dateOfRental
        return newClient
    }
    
    
    
    public func updateClient(_ name:String, phone:String, passport: String, dateOfRental: Date) -> Clients{
        let updatedClient = Clients()
        updatedClient.name = name
        updatedClient.phone = phone
        updatedClient.passportNumber = passport
        updatedClient.dateOfRental = dateOfRental
        
        try! realm?.write {
            realm?.add(updatedClient, update: .modified)
            }
        return updatedClient
   
    }
}
