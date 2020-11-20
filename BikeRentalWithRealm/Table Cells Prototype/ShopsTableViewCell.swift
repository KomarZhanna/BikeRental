//
//  ShopsTableViewCell.swift
//  BikeRentalWithRealm
//
//  Created by Zhanna on 02.11.2020.
//

import UIKit

class ShopsTableViewCell: UITableViewCell {

    @IBOutlet weak var shopNameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var dropDownButton: UIButton!
    
    let shopsFunctions = ShopsStore()

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
