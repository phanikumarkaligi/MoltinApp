//
//  CartItemTableViewCell.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 21/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var productImageView : UIImageView!
    @IBOutlet weak var priceLabel : UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
