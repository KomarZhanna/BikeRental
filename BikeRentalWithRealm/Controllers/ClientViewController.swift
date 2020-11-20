//
//  ClientViewController.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 12.11.2020.
//

import UIKit

class ClientViewController: UIViewController {
    
    private var items = ClientsStore()
    
    let configuration: Configuration = Configuration()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configuration.configureTable(tableView)
        
    }
    
}
extension ClientViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let clients = items.fetchAllClients() else{return 0}
        return clients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath) as! ClientsTableViewCell
        guard let clients = items.fetchAllClients() else{return cell}
        let item = clients[indexPath.row]
        cell.nameLabel?.text = item.name
        cell.passportLabel.text = item.passportNumber
        cell.phoneNumberLabel.text = item.phone
        cell.rentalDateLabel.text = item.formattedDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let clients = items.fetchAllClients()
        if editingStyle == .delete {
            let item = clients?[indexPath.row]
            items.deleteClient(item!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
