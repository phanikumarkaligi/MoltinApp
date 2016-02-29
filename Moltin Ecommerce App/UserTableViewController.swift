//
//  UserTableViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 26/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {

    var contentsArray = ["My Orders","My Points","Rate Me","Notifications","App Feedback", "Collections","refer And Earn","Policy terms & Trust Pay", "Contact Us","FAQs","Logout"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
    Moltin.sharedInstance().customer.findWithParameters(nil, success: { (responseObj) -> Void in
        print("found some user \(responseObj)")
        }) { (failedResponseObj, err ) -> Void in
            print("doesn't found any user \(failedResponseObj)")
        }
    

    }

      // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 7
        }
        
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        if indexPath.section == 0 {
            
            cell.textLabel?.text = contentsArray[indexPath.row]
            
        } else if indexPath.section == 1 {
            
            cell.textLabel?.text = contentsArray[indexPath.row + 7]
        }
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.textColor = UIColor.grayColor()
        
        return cell
    }
    
    
    
    
    @IBAction func logIn(sender : UIButton ) {
        
        Moltin.sharedInstance().customer.createWithParameters(nil, success: { (responseObj : [NSObject : AnyObject]!) -> Void in
            print("response object is \(responseObj)")
            
            }) { (failedResponseObj : [NSObject : AnyObject]!, error : NSError!) -> Void in
              print("failed response obj is \(failedResponseObj)")
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

    
    

}
