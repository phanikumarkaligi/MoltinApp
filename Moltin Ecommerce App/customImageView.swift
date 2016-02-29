//
//  customImageView.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 18/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class customImageView: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.lightGrayColor().CGColor
        layer.borderWidth = 1.0
        clipsToBounds = true
    }
    
    
    
}
