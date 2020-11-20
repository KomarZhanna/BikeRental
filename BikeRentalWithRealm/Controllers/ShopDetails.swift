//
//  ViewController.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 15.10.2020.
//

import UIKit
import RealmSwift
import MapKit
import GooglePlacesSearchController


class ShopDetails: UIViewController {
    
    
    @IBOutlet weak var shopName: UITextField!
    
    @IBOutlet weak var shopPhone: UITextField!
    
    @IBOutlet weak var shopEmail: UITextField!
    
    @IBOutlet weak var shopAddress: UITextField!
    let GoogleMapsAPIServerKey = "AIzaSyAsTPhMhOagjwjABIMAa6eRcT6DQ-WV6yU"

    lazy var placesSearchController: GooglePlacesSearchController = {
        let controller = GooglePlacesSearchController(delegate: self,
                                                      apiKey: GoogleMapsAPIServerKey,
                                                      placeType: .address
            // Optional: coordinate: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423),
            // Optional: radius: 10,
            // Optional: strictBounds: true,
            // Optional: searchBarPlaceholder: "Start typing..."
        )
        //Optional: controller.searchBar.isTranslucent = false
        //Optional: controller.searchBar.barStyle = .black
        //Optional: controller.searchBar.tintColor = .white
        //Optional: controller.searchBar.barTintColor = .black
        return controller
    }()

    @IBOutlet weak var searchAddress: UIButton!

    
    @IBAction func searchAddress(_ sender: Any) {
        present(placesSearchController, animated: true, completion: nil)
    }
    
}

extension ShopDetails: GooglePlacesAutocompleteViewControllerDelegate {
    func viewController(didAutocompleteWith place: PlaceDetails) {
        print(place.description)
        placesSearchController.isActive = false
    }
    
    func viewController(didManualCompleteWith text: String) {
        print(text)
        placesSearchController.isActive = false
    }
}
