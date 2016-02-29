//
//  ItemDetailViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 21/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var segmentControl : UISegmentedControl!
    @IBOutlet weak var container : UIView!
    @IBOutlet weak var quantitiyLabel : UILabel!
    @IBOutlet weak var stepperControl : UIStepper!
    @IBOutlet weak var container2 : UIView!
    @IBOutlet weak var container3 : UIView!
    @IBOutlet weak var container4 : UIView!


    
    
    var item : Item = Item()
    var Overview : OverView?
    var previewImagesUrls = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
      print("detail controller - view did load")
   //   print(previewImagesUrls)
    
      self.navigationItem.title = item.name
    
//        Overview = (NSBundle.mainBundle().loadNibNamed("OverView", owner: self, options: nil)[0] as? OverView)
//        Overview?.imageUrls = previewImagesUrls
        // Overview?.frame = CGRectMake(0, 50, 320, 400)
      //  self.container.addSubview(Overview!)

        
 }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
     print("detail controller - view did appear")
        if segmentControl.selectedSegmentIndex == 0 {
            
            container.hidden = false
            container2.hidden = true
            container3.hidden = true
            container4.hidden = true

        }
    }
    
    @IBAction func segmentChanged(sender : UISegmentedControl ) {
        
        if segmentControl.selectedSegmentIndex == 2 {
//let vc = storyboard?.instantiateViewControllerWithIdentifier("some1")
//            container.addSubview((vc?.view)!)
//            container.clipsToBounds = true
            container.hidden = true
            container2.hidden = true
            container3.hidden = false
            container4.hidden = true
            
        }
            else if segmentControl.selectedSegmentIndex == 0 {
            container.hidden = false
            container2.hidden = true
            container3.hidden = true
            container4.hidden = true
            
    
            }
        else if segmentControl.selectedSegmentIndex == 1 {
            
//            let vc = storyboard?.instantiateViewControllerWithIdentifier("some")
//            container.addSubview((vc?.view)!)
//            
//            container.clipsToBounds = true
         
        container.hidden = true
        container2.hidden = false
        container3.hidden = true
        container4.hidden = true
            
        }  else if segmentControl.selectedSegmentIndex == 3 {
            container.hidden = true
            container2.hidden = true
            container3.hidden = true
            container4.hidden = false
        }
}
    
    @IBAction func stepperValueChanged ( sender : UIStepper) {
        
          quantitiyLabel.text = "Quantity : \(Int(sender.value))"
    }
    
    
    // MARK: - Moltin Methods 
    
    @IBAction  func addItemToCart(sender : UIButton) {
        
        if stepperControl.value != 0 {
            
            
        
        
        
        Moltin.sharedInstance().cart.insertItemWithId(item.id, quantity: 1, andModifiersOrNil: nil, success: { (response :[NSObject : AnyObject]!) -> Void in
            print("Item Added to cart Successfully")
            }) { (response :[NSObject : AnyObject]!, error :NSError!) -> Void in
                print("Error While Adding Item to Cart")
        }
        
        
        
        
        
        
        
        } else if stepperControl.value == 0 {
            let alertControl = UIAlertController(title: "Add Atleast One Item", message: "Please Increment the no.of Items", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertControl.addAction(action)
            presentViewController(alertControl, animated: true, completion: nil)
        }
    }
    
    
    func loadItemFromServer() {
        
  Moltin.sharedInstance().product.getWithId(item.id, success: { (response) -> Void in
    
   if let mainDictionary = response["result"] as? NSDictionary ,
    let imagesArray = mainDictionary["images"] as? NSArray
    {
        print("something123")

        for (var i = 0 ; i < imagesArray.count ; i++) {
         
            if let innerDict = imagesArray[i] as? NSDictionary {
            let str = innerDict.valueForKeyPath("url.https") as? String
            self.previewImagesUrls.append(str!)
            }
            
        }
        self.createOverView()

        
    }
    
    
    }) { (failureResponse, error ) -> Void in
        print(error)
        
        }
}
    
  
    func createOverView() {
        
            Overview = (NSBundle.mainBundle().loadNibNamed("OverView", owner: self, options: nil)[0] as? OverView)
            Overview?.imageUrls = previewImagesUrls
            // Overview?.frame = CGRectMake(0, 50, 320, 400)
            self.container.addSubview(Overview!)
          
        }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         print("detail controller - prepapare for segue")
        if segue.identifier == "toSegmentOverViewVC" {
            let dvc = segue.destinationViewController as? SegmentOverViewCollectionViewController
            dvc?.imagesNames = previewImagesUrls
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("details controller - viewwillappear")
    }
    
  
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("detail controller - init with coder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("detail controller - awake from nib")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("detail controller - init with nib name")
    }
    
    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
         print("detail controller - perform segue with identifier")
        
        
        
    }


}
