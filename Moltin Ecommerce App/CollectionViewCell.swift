//
//  CollectionViewCell.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 17/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureSize() {
        
        let width = (UIScreen.mainScreen().bounds.width - 2.0 ) / 2.0
        let size = CGSizeMake(width,200)
        self.bounds.size = size
        
    }

}
