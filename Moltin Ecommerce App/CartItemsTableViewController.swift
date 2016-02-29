//
//  CartItemsTableViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 21/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class CartItemsTableViewController: UITableViewController {
    
    var itemsArray : [[String : String]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                
        
        Moltin.sharedInstance().cart.getContentsWithsuccess({ (response) -> Void in
            let cartData = (response as NSDictionary)
            print("Got cart data: \(cartData)")
            
            // Extract the products out of the cart...
            let cartProducts = cartData.valueForKeyPath("result.contents") as? [String : AnyObject]
            //  Extract the name,sale price and image of the product
if let p = cartProducts  {
    let value = Array(p.values)
    for i in 0..<value.count {
    var temp : [String : String] = [:]
        temp["name"] = value[i]["title"] as? String
        temp["price"] = "\(value[i]["sale_price"] as! NSNumber)"
        temp["id"] = value[i]["id"] as? String
        if let imagesArray = value[i]["images"] as? [[String:AnyObject]] {
            
            for imageDict in imagesArray {
    if imageDict["name"] as? String == "smallImage.jpeg" {
                let image = imageDict["url"]!["https"] as? String
                temp["imageURL"] = image
        print("required url is \(image)")
                }
            }
            
        } else {
          //  let count = value[i]["images"]!!.count
            temp["imageURL"] = value[i]["images"]!![0].valueForKeyPath("url.https") as? String
        }
     
        let count = value[i]["images"]!!.count
       temp["imageURL"] = value[i]["images"]!![count-1].valueForKeyPath("url.https") as? String
         self.itemsArray.append(temp)
    }
    self.tableView.reloadData()
}
            
            // Get cart total price too
            let cartPrice = cartData.valueForKeyPath("result.totals.post_discount.raw.with_tax") as? NSNumber
         //   print("Total cart price: \(cartPrice)")
            
            }, failure: { (response, error) -> Void in
                print("Something went wrong...")
                print(error)
        })
      
            
            
     
            
            
            
            
        
       
    }
    
    
    
    

  
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CartItemTableViewCell

       let itemOfInterest = itemsArray[indexPath.row]
        
        if let name = itemOfInterest["name"]  {
            cell.nameLabel.text = name
        }
        if let price = itemOfInterest["price"] {
            cell.priceLabel.text = "$\(price)"
        }
        if let imageUrl = itemOfInterest["imageURL"] {
            let data = NSData(contentsOfURL: NSURL(string: imageUrl)!)
            let image = UIImage(data: data!)
            cell.imageView?.image = image
        }
        
return cell
    }
    

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        let button = UIButton(frame: CGRectMake(self.view.frame.origin.x / 2.0, self.view.frame.size.height - 60 , 30, 50))
        
      //  UIWindow.addSubview(button)
        
        
    }
    
    
    
    
    
    @IBAction func removeFromCart(sender : UIButton) {
        
    let index = tableView.indexPathForCell((sender.superview?.superview as? CartItemTableViewCell)!)
    let id = itemsArray[(index?.row)!]["id"]
        
     Moltin.sharedInstance().cart.removeItemWithId(id, success: { (successResponse) -> Void in
        print("item removed from cart successfully : \(successResponse)")
        self.tableView.reloadData()
        
        let alertcontrol = UIAlertController(title: "SUCCESS", message: "removed Item From Cart", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertcontrol.addAction(action)
        self.presentViewController(alertcontrol, animated: true, completion: nil)
        
        
        }) { (failureResponse, err) -> Void in
            print("unable to remove item from cart : \(failureResponse)")
      let alertcontrol = UIAlertController(title: "SORRY CAN'T REMOVE", message: "Unable to remove Item From Cart", preferredStyle: .Alert)
     let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertcontrol.addAction(action)
    self.presentViewController(alertcontrol, animated: true, completion: nil)
            
            
            
            
            
            
            
        }
        
        
        
    }
    
  
    
  
    
    
    
    
    
    
    
    
    
    
    
    
   }
