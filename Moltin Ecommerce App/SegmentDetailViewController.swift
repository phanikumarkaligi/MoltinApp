//
//  SegmentDetailViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 29/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class SegmentDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView : UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSizeMake(view.bounds.width, 300)

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
