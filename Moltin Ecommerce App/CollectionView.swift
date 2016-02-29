//
//  CollectionView.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 18/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {

   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init with coder")
        let width = UIScreen.mainScreen().bounds.width
      //  self.bounds.size = CGSizeMake(width, 220)
        self.frame = CGRectMake(0, 210, width, width)

    }
    
    

}
