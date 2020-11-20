//
//  BikesTableViewCell.swift
//  BikeRental
//
//  Created by Zhanna on 07.10.2020.
//

import UIKit

class BikesTableViewCell: UITableViewCell {

    @IBOutlet weak var typeAndModelLabel: UILabel!
    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var salePriceLabel: UILabel!
    
    @IBOutlet weak var rentalPriceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
