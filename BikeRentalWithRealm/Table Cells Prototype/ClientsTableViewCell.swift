//
//  ClientsTableViewCell.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 15.10.2020.
//

import UIKit

class ClientsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var passportLabel: UILabel!
    @IBOutlet weak var rentalDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
