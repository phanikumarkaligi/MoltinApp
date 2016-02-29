//
//  testViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 27/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var scrollView : UIScrollView!
    
    var imagesNames : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    print("testview controller - viewdidload")
    print("items in the imagesNames array \(imagesNames)")
        
  }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("testview controller - viewwillappear")
        
        let reqWidth = UIScreen.mainScreen().bounds.width
        let  reqHeight = CGFloat(UIScreen.mainScreen().bounds.height - 200)
        let size = CGSizeMake(CGFloat(imagesNames.count * Int(reqWidth)), 240)
        scrollView.contentSize = size
        var xOffset = 0
        
        for (var i = 0 ; i < imagesNames.count ; i++) {
            
            let image = UIImage(named: imagesNames[i] )
            let rect = CGRectMake(CGFloat(xOffset) + 20, 10, reqWidth - 20, reqHeight - 10)
            let imageView = UIImageView(frame: rect)
            imageView.image = image
            xOffset = Int(reqWidth) * i
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            scrollView.addSubview(imageView)
        }
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            print("testview controller - viewdidappear")
      
    let tim = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "displayImages", userInfo: nil, repeats: false)
  }
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            print("testview controller - init with coder")

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
            print("testview controller - awake from nib")

    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            print("testview controller - init with nib name")
    }
    
    func displayImages() {
        let reqWidth = UIScreen.mainScreen().bounds.width
        let  reqHeight = CGFloat(UIScreen.mainScreen().bounds.height - 200)
        let size = CGSizeMake(CGFloat(imagesNames.count * Int(reqWidth)), 240)
        scrollView.contentSize = size
        var xOffset = 0
        
        for (var i = 0 ; i < imagesNames.count ; i++) {
            
            let image = UIImage(named: imagesNames[i] )
            let rect = CGRectMake(CGFloat(xOffset) + 20, 10, reqWidth - 20, reqHeight - 10)
            let imageView = UIImageView(frame: rect)
            imageView.image = image
            xOffset = Int(reqWidth) * i
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            scrollView.addSubview(imageView)
    }
    }
    
}
