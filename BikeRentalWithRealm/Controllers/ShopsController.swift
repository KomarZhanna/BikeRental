//
//  ShopsController.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 02.11.2020.
//

import UIKit

class ShopsController: UIViewController {

    @IBOutlet weak var shopsTable: UITableView!
    
    private var items = ShopsStore()
    let configuration: Configuration = Configuration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shopsTable.dataSource = self
        shopsTable.delegate = self
        // Do any additional setup after loading the view.
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configuration.configureTable(shopsTable)
        
    }
    
    @IBAction func addButtonTaped(_ sender: UIButton) {
    }
    
    
    
}


extension ShopsController: UITableViewDelegate, UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let shops = items.fetchAllShops() else{return 0}
        return shops.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopsTableViewCell
        guard let shops = items.fetchAllShops() else{return cell}
        let item = shops[indexPath.row]
        cell.shopNameLabel.text = item.name
        cell.addressLabel.text = item.address
        cell.phoneLabel.text = item.phoneNumber
        cell.emailLabel.text = item.email
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let shops = items.fetchAllShops()
        if editingStyle == .delete {
            let item = shops?[indexPath.row]
            items.deleteShop(item!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
}


