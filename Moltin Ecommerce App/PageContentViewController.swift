//
//  PageContentViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 18/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController{
    
    var index : Int = 0
    // outlets 
    @IBOutlet weak var imageView : UIImageView!
    
     var imageName : String = "" {
        didSet {
            if let imgView = imageView {
                imageView.image = UIImage(named: imageName)
                }
        }
    }
    
  required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  view.frame = CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
 
        
      
        print("page content vc's frame is \(view.frame)")
        print("page content vc's image view frame is \(imageView.frame)")
    }
    
   
   
  
    
    
}
