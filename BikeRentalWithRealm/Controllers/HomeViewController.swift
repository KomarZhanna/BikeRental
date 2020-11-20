//
//  HomeViewController.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 19.11.2020.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    @IBOutlet weak var helloUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser{
        
            helloUserLabel.text = "Hello, \(String(describing: user.displayName))!"
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        validateAuth()
        
    }
    
    private func validateAuth() {
        if (FirebaseAuth.Auth.auth().currentUser == nil){
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.navigationBar.isHidden = true
            present(nav, animated: true, completion: nil)
        }
    }

    
    @IBAction func logOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
}
