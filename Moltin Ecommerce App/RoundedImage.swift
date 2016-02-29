//
//  RoundedImage.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 20/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
 // let radius = self.bounds.width < self.bounds.height
        layer.cornerRadius =  self.frame.width / 2.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.lightGrayColor().CGColor
        clipsToBounds = true
    }

}
