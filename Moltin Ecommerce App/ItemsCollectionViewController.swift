//
//  ItemsCollectionViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 20/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class ItemsCollectionViewController: UICollectionViewController {
    
    var passedString : String = ""
    var itemsArray = [Item]()
    var previewImagesUrls : [String] = []
    var currentIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

       let layout = UICollectionViewFlowLayout()
       layout.itemSize = CGSizeMake((UIScreen.mainScreen().bounds.width - 1.0) / 2.0, 220)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        layout.sectionInset = UIEdgeInsetsMake(1.0, 0, 1.0, 0)
        collectionView?.collectionViewLayout = layout
        
        
       // moltin data fetching 
        Moltin.sharedInstance().product.listingWithParameters(nil, success: { (response) -> Void in
            if let  result = response["result"] as? Array<NSDictionary> {
                for eachDict in result   {
print("************************************\(eachDict)" )
  if let str = eachDict.valueForKeyPath("collection.data.title") as? String where str == self.passedString
  {
     //  print("Str is \(str)")
    let item = Item()
    
    if let weight = eachDict["weight"] as? Int {  item.weight = weight  }
    if let title = eachDict["title"] as? String { item.name = title }
    if let  price = eachDict.valueForKeyPath("price.data.rounded.with_tax") as? Float {  item.price = price }
    if let salePrice = eachDict["sale_price"] as? Float { item.salePrice = salePrice }
    if let descp = eachDict["description"] as? String { item.description = descp }
    if let urlArray = eachDict.valueForKeyPath("images") as? NSArray { let url = urlArray[0].valueForKeyPath("url.https") as! String ; item.imageURLs.append(url) }
    if let id = eachDict.valueForKeyPath("id") as? String { item.id = id  }
    
   // code for populating the preview images urls 
    Moltin.sharedInstance().product.getWithId(item.id, success: { (response) -> Void in
        if let mainDictionary = response["result"] as? NSDictionary ,
            let imagesArray = mainDictionary["images"] as? NSArray
        {
            print("something123")
            
            for (var i = 0 ; i < imagesArray.count ; i++) {
                
                if let innerDict = imagesArray[i] as? NSDictionary {
                    let str = innerDict.valueForKeyPath("url.https") as? String
                    item.previewImagesUrls.append(str!)
                   // print(item.previewImagesUrls)
                }
            }
            self.itemsArray.append(item)
          //  print("self.items array \(self.itemsArray)")
            self.collectionView?.reloadData()

        }
        
}) { (failureResponse, error ) -> Void in
            print(error)
            }

 

} // end of all if lets 
                    
                }
                print("before reload data")
                self.collectionView?.reloadData()
            }
            
            
            
            }) { (response, error) -> Void in
                print("errorresults is \(error)")
                
        }
 }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? ItemsCollectionViewControllerCell
        
       let data = NSData(contentsOfURL: NSURL(string: itemsArray[indexPath.row].imageURLs[0])!)
        let image = UIImage(data: data!)
        
        cell?.imageView.image = image
        cell?.priceLabel.text = "\(itemsArray[indexPath.row].price)"
        cell?.salePriceLabel.text = "\(itemsArray[indexPath.row].salePrice)"
        
            
        
        return cell!
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toItemDetailViewController" {
            
          let dvc = segue.destinationViewController as? ItemDetailViewController
         let index = collectionView?.indexPathForCell(sender as! ItemsCollectionViewControllerCell)
     //  let index = sender as? NSIndexPath
            let item = itemsArray[(index?.row)!]
            dvc?.item = item
            dvc?.previewImagesUrls = item.previewImagesUrls
            
        }
    }

    
    
//    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//    self.performSegueWithIdentifier("toItemDetailViewController", sender: indexPath)
//        
//      
//        }
//    
    func loadItemFromServer(id : String, item : Item) {
Moltin.sharedInstance().product.getWithId(id, success: { (response) -> Void in
if let mainDictionary = response["result"] as? NSDictionary ,
                let imagesArray = mainDictionary["images"] as? NSArray
            {
                print("something123")
                
                for (var i = 0 ; i < imagesArray.count ; i++) {
                    
                    if let innerDict = imagesArray[i] as? NSDictionary {
                        let str = innerDict.valueForKeyPath("url.https") as? String
                    item.previewImagesUrls.append(str!)
                    }
                }
                self.itemsArray.append(item)
            }
            
            
            }) { (failureResponse, error ) -> Void in
                print(error)
                
        }
    }

    
    
    
    
}
