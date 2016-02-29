//
//  BrandListTableViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 20/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class BrandListTableViewController: UITableViewController {
    
    var descriptions = [String]()
    var imageURLs : [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

    Moltin.sharedInstance().brand.listingWithParameters(["limit": 100], success: { (resultsDict :[NSObject : AnyObject]!) -> Void in
     
        if let results = resultsDict as? NSDictionary      {
            if let array = results.valueForKeyPath("result") as? Array <AnyObject> {
                for item in 0..<array.count {
let description = array[item].valueForKeyPath("description") as? String
                    if description != nil {
                        self.descriptions.append(description!)
                    }
let imageUrls = array[item].valueForKeyPath("images.url.https") as? [String]
                    if imageUrls != nil {
                        self.imageURLs.append(imageUrls![0])
                    }
                }
                self.tableView.reloadData()
            }
            
        }

        
        
        
        }) { (errorDict : [NSObject : AnyObject]!,error:  NSError!) -> Void in
            print("error Dictionary is \(errorDict)")
        
        }
        
   }

   
    
    @IBAction func backBarButtonPressed() {
        
      dismissViewControllerAnimated(true, completion: nil)
        
        
    }
 
    
    
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return descriptions.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? BrandsTableViewCell
        cell?.configureCell(descriptions[indexPath.row], imageUrl: imageURLs[indexPath.row])
    


        return cell!
    }
    

  

    
    // MARK: - Navigation

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "toItemsCollectionViewController" {
            
            let dvc = segue.destinationViewController as? ItemsCollectionViewController
            dvc?.passedString = descriptions[(tableView.indexPathForSelectedRow?.row)!]
        }
        
    }
    

}
