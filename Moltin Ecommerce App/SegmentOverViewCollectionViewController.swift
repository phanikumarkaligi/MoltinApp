//
//  SegmentOverViewCollectionViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 29/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class SegmentOverViewCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var imagesNames : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    print("segment overview collection view controller - view did load")
    print("content in the imagesNames \(imagesNames)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        
        
        
        
        
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imagesNames.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? SegmentOverViewCollectionViewCell
        
        let data = NSData(contentsOfURL: NSURL(string: imagesNames[indexPath.row])!)
        let image = UIImage(data: data!)
        
        cell?.imgView.image = image
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("segment overview collection view controller - view will appear")

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("segment overview collection view controller - view did appear")

    }
    

    
  required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("segment overview collection view controller - init woth coder")

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("segment overview collection view controller - awake from nib")

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize = CGSizeMake(collectionView.bounds.width, collectionView.bounds.height)
        return cellSize
    }
}
