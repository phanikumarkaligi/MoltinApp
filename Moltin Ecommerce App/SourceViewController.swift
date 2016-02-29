//
//  SourceViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 20/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    // pageviewcontroller
    var pageViewController : UIPageViewController!
    var pagecontrol : UIPageControl!
    private let contentImages = ["image1.jpg","image2.jpg","image3.jpg"]
    var pageControlIndex : Int = 0
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPageViewController()
        setupPageControl()

    }

    
    //MARK: - page view controller methods
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        print("view controller after view controller")
        let itemController = viewController as! PageContentViewController
        pageControlIndex = itemController.index
        
        if pageControlIndex == NSNotFound {
            return nil
        }
        
        if pageControlIndex == contentImages.count - 1 {
            pageControlIndex = 0
            
        } else {
            pageControlIndex++
            
        }
      //  pagecontrol.currentPage = pageControlIndex
        return getItemController(pageControlIndex)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        print("view controller before view controller")
        let itemController = viewController as! PageContentViewController
        
        pageControlIndex = itemController.index
        
        if pageControlIndex == NSNotFound {
            return nil
        } else if pageControlIndex == 0 {
            pageControlIndex = contentImages.count - 1
        } else {
            pageControlIndex--
        }
       // pagecontrol.currentPage = pageControlIndex
        return getItemController(pageControlIndex)
    }
    
    private func createPageViewController() {
        print("create page view controller")
        pageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageViewController.dataSource = self
        
        if contentImages.count > 0 {
            let firstViewController = getItemController(0)!
            let startingViewControllers : NSArray = [firstViewController]
            pageViewController.setViewControllers(startingViewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil )
        }
        //  pageViewController.view.frame.size = CGSizeMake(view.frame.width, 1000)
        addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMoveToParentViewController(self)
        print("page view controllers frame is \(pageViewController.view.frame)")
        
    }
    
    private func setupPageControl() {
        
               let appearance = UIPageControl.appearance()
              // appearance.frame  = CGRectMake(0, 200, view.bounds.width, 30)
                appearance.pageIndicatorTintColor = UIColor.lightGrayColor()
                appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        let bgColor = UIColor(red: 40/255, green: 178/255, blue: 182/255, alpha: 1.0)
                appearance.backgroundColor = bgColor
        
//        pagecontrol = UIPageControl(frame: CGRectMake(0, 160, view.frame.size.width, 50))
//        //  pagecontrol.currentPage = 0
//        pagecontrol.numberOfPages = contentImages.count
//        pagecontrol.pageIndicatorTintColor = UIColor.darkGrayColor()
//        pagecontrol.backgroundColor = UIColor.magentaColor()
//        pagecontrol.currentPageIndicatorTintColor = UIColor.whiteColor()
//        view.addSubview(pagecontrol)
    }
    
    func getItemController(itemIndex : Int) -> PageContentViewController? {
        print("get item view controller")
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as? PageContentViewController
            print("before")
            
            //    pageItemController?.view.frame = CGRectMake(0, 20, view.frame.width, 1000)
            print("after")
            pageItemController?.index = itemIndex
            pageItemController?.imageName = contentImages[itemIndex]
            return pageItemController
        }
        return nil
    }
    
    //    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    //        return contentImages.count
    //    }
    //
    //    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    //        return 0
    //    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        print("will translation to view controllers")
        let pageContentVC = pendingViewControllers[0] as? PageContentViewController
        self.pagecontrol.currentPage = (pageContentVC?.index)!
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("did finish animating previous view controller")
        if !completed  {
            let pageContentView : PageContentViewController = previousViewControllers[0] as! PageContentViewController
            pagecontrol.currentPage = pageContentView.index
        }
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return  contentImages.count
    }
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
}
