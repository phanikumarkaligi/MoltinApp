//
//  FirstViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 17/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {
    
    // scroll view 
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var contentView : UIView!
    
    
   
    
    
    var products : NSArray = []
    var imagesUrls : [[AnyObject]] = []
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        
     

Moltin.sharedInstance().setPublicId("sS4Bbu0VKgPF2QWKlskUXOwVq7VSw3RMPjfBosey")
/*
Moltin.sharedInstance().product.listingWithParameters(["limit": 100], success: { (response) -> Void in
    // products is an array of all of the products that match the parameters...
     self.products = response["result"] as! NSArray
 //   print("Got products: \(self.products)")
    
    for prodct in 0..<self.products.count {
        if let imagesArray = self.products[prodct]["images"] as? [[String:AnyObject]] {
            for item in 0..<imagesArray.count  {
                if let httpUrlDict = imagesArray[item]["url"] as? [String:AnyObject] , httpUrl = httpUrlDict["https"] {
                    print(httpUrl)
              //  self.imagesUrls[prodct].append(httpUrl)
                
                }
            }
        }
    //    self.collectionView.reloadData()
    }
    
    // And product is our chosen product dictionary...
    let product = self.products.firstObject
    print("Our chosen product is: \(product)")
    
    }, failure: { (response, error) -> Void in
        print("Couldn't get products, something went wrong...")
        print(error)
})
      
*/
    /*
    Moltin.sharedInstance().brand.listingWithParameters(["limit": 100], success: { (resultsDict :[NSObject : AnyObject]!) -> Void in
            
if let results = resultsDict as? NSDictionary      {
    if let array = results.valueForKeyPath("result") as? Array <AnyObject> {
                for item in 0..<array.count {
                 let descriptions = array[item].valueForKeyPath("description") as? String
                let imageUrls = array[item].valueForKeyPath("images.url.https")
                                           }
                    }
    
                                                   }
    
            }) { (errorDict : [NSObject : AnyObject]!,error:  NSError!) -> Void in
                print("error Dictionary is \(errorDict)")

        }
        */

//        Moltin.sharedInstance().collection.getWithId("1189110173587734596", success: { (results :[NSObject : AnyObject]!) -> Void in
//            print("results is \(results)")
//            }) { (errorResults :[NSObject : AnyObject]!, error :NSError!) -> Void in
//                print("errorresults is \(errorResults)")
//    
//        }
        
//        Moltin.sharedInstance().product.listingWithParameters(nil, success: { (response) -> Void in
//            if let  result = response["result"] as? Array<NSDictionary> {
//                for eachDict in result  {
//                    if let str = eachDict.valueForKeyPath("collection.data.title") as? String where str == "passedString" {
//                        
//                    }
//                }
//            }
//            
//            
//            
//            }) { (response, error) -> Void in
//                print("errorresults is \(error)")
//    
//        }

    }

    
    
   
   
    
 
 
}

