//
//  OverView.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 21/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class OverView: UIView,UIScrollViewDelegate {

    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var weightLabel : UILabel!
    @IBOutlet weak var salePriceLabel : UILabel!
    
    var imageUrls = [String]()
    
    var scrollView : UIScrollView!
    @IBOutlet weak var innerScrollView : UIScrollView!
    
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
 }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("wakr frm nib")
        print("images count = \(imageUrls.count)")
       
        let requiredWidth = Int(self.bounds.width)
        let  requiredHeight = CGFloat(220)
        
        innerScrollView.contentSize = CGSizeMake(CGFloat(requiredWidth * imageUrls.count) , requiredHeight)
        
        for ( var i = 0 ; i < imageUrls.count ; i++) {
            let image = UIImage(named: imageUrls[i])
            let rect = CGRectMake(CGFloat(i * Int(self.bounds.width) + 20), 10, CGFloat(self.bounds.width - 20), 200)
            
            let imageView = UIImageView(frame: rect)
            imageView.image = image
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            innerScrollView.addSubview(imageView)
            
        }
//     let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "createContentViewForScrollView", userInfo: nil, repeats: false)
        
 }
    
    func createContentViewForScrollView() {
        
        let requiredWidth = Int(self.bounds.width)
        let  requiredHeight = CGFloat(220)
        
        innerScrollView.contentSize = CGSizeMake(CGFloat(requiredWidth * imageUrls.count) , requiredHeight)
        
        for ( var i = 0 ; i < imageUrls.count ; i++) {
            addImageWithName(imageUrls[i], atPosition: i)
            
        }
        
    }
    
    func addImageWithName(name : String , atPosition : Int ) {
    let image = UIImage(named: name)
    let rect = CGRectMake(CGFloat(atPosition * Int(self.bounds.width) + 20), 10, CGFloat(self.bounds.width - 20), 200)
    
    let imageView = UIImageView(frame: rect)
    imageView.image = image
    imageView.contentMode = UIViewContentMode.ScaleAspectFit
    innerScrollView.addSubview(imageView)
    }
    
    
//    override func drawRect(rect: CGRect) {
//        super.drawRect(rect)
//        
//        createContentViewForScrollView()
//    }
//
}
