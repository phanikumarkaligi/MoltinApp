//
//  BrandsTableViewCell.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 20/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class BrandsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BrandImageView : UIImageView!
    @IBOutlet weak var brandName : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    func configureCell(description : String , imageUrl : String) {
        brandName.text = description
        
        let imageData = NSData(contentsOfURL: NSURL(string: imageUrl)!)
        if  imageData != nil {
            BrandImageView.image = UIImage(data: imageData!)
        }
  }
    
    

}
