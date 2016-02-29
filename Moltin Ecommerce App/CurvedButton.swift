//
//  CurvedButton.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 01/03/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class CurvedButton: UIButton {

   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    layer.cornerRadius = 5.0
    self.clipsToBounds = true
    
    
    }

}
