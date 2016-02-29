//
//  CommunicationAddressViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 22/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class CommunicationAddressViewController: UIViewController, UITextFieldDelegate {

//    @IBOutlet weak var firstNameLabel : UILabel!
//    @IBOutlet weak var lastNameLabel : UILabel!
//    @IBOutlet weak var emailLabel : UILabel!
//    @IBOutlet weak var address1Label : UILabel!
//    @IBOutlet weak var address2Label : UILabel!
//    @IBOutlet weak var countyLabel : UILabel!
//    @IBOutlet weak var countryLabel : UILabel!
//    @IBOutlet weak var phoneLabel : UILabel!
//    @IBOutlet weak var cityLabel : UILabel!
//    @IBOutlet weak var postCodeLabel : UILabel!
    
    @IBOutlet weak var firstNameTextField : UITextField!
    @IBOutlet weak var lastNameTextField : UITextField!
    @IBOutlet weak var address1TextField : UITextField!
    @IBOutlet weak var address2NameTextField : UITextField!
    @IBOutlet weak var cityTextField : UITextField!
    @IBOutlet weak var countyTextField : UITextField!
    @IBOutlet weak var countryTextField : UITextField!
    @IBOutlet weak var postCodeTextField : UITextField!
    @IBOutlet weak var emailTextField : UITextField!
    @IBOutlet weak var phoneTextField : UITextField!
    
    
    @IBOutlet weak var scrollView : UIScrollView!
    
    var currentTextField : UITextField! = UITextField(frame: CGRectZero)
    
    
    var shippingAddress : [String : String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Address"
        
        
        // registering with center for keyboard events
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillAppear:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    @IBAction func checkOutPressed() {
        
//        if let firstName = firstNameTextField.text ,
//            let lastname = lastNameTextField.text ,
//            let email = emailTextField.text ,
//            let address1 = address1TextField.text ,
//            let address2 = address2NameTextField.text ,
//            let city = cityTextField.text ,
//            let county = countyTextField.text ,
//            let country = countryTextField.text ,
//            let postcode = postCodeTextField.text ,
//            let phone = phoneTextField.text  {
        if ( firstNameTextField.text != "" && lastNameTextField.text != "" && emailTextField.text != "" && address1TextField.text != "" && address2NameTextField.text != "" && cityTextField.text != "" && countyTextField.text != "" && countryTextField.text != "" && postCodeTextField.text != "" && phoneTextField.text != "" ) {
        
                   let firstName = firstNameTextField.text
                    let lastname = lastNameTextField.text
                    let email = emailTextField.text
                    let address1 = address1TextField.text
                    let address2 = address2NameTextField.text
                    let city = cityTextField.text
                    let county = countyTextField.text
                    let country = countryTextField.text
                    let postcode = postCodeTextField.text
                    let phone = phoneTextField.text
                // if above all exists
                shippingAddress["firstName"] = firstName
                shippingAddress["lastName"] = lastname
                shippingAddress["email"]    = email
                shippingAddress["address1"] = address1
                shippingAddress["address2"] = address2
                shippingAddress["city"]     = city
                shippingAddress["county"]   = county
                shippingAddress["country"]  = country
                shippingAddress["postcode"] = postcode
                shippingAddress["phone"]    = phone
            print(shippingAddress)
    // create an Order
    let orderParameters = [
        "customer": ["first_name":       shippingAddress["firstName"]!,
            "last_name":  shippingAddress["lastName"]!,
            "email":      shippingAddress["email"]!],
        "shipping": "free_shipping",
        "gateway": "dummy",
        "bill_to": ["first_name":    shippingAddress["firstName"]!,
            "last_name":  shippingAddress["lastName"]!,
            "address_1":  shippingAddress["address1"]!,
            "address_2":  shippingAddress["address2"]!,
            "city":       shippingAddress["city"]!,
            "county":     shippingAddress["county"]!,
            "country":    shippingAddress["country"]!,
            "postcode":   shippingAddress["postcode"]!,
            "phone":     shippingAddress["phone"]!],
        "ship_to": "bill_to"
        ] as [NSObject: AnyObject]

                Moltin.sharedInstance().cart.orderWithParameters(orderParameters, success: { (response) -> Void in
                    // Order succesful
                    // print("Order succeeded: \(response)")
                    
                    // Extract the Order ID so that it can be used in payment too...
                    let orderId = (response as NSDictionary).valueForKeyPath("result.id") as? String
                    
                    self.shippingAddress["orderID"] = orderId
                    print("Order ID: \(orderId)")
                    
                    
                    
    let alertControl = UIAlertController(title: "Order Created", message: "Order Successfully Placed Proceed to Pay", preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
        
    self.performSegueWithIdentifier("toPaymentViewController", sender: nil)
    })
    
    alertControl.addAction(action)
    
    self.presentViewController(alertControl, animated: true, completion: nil)
                    
                    
                    }, failure: { (response, error) -> Void in
                        // Order failed
                        print("Order error: \(error)")
                })
                
       

        }
        else {
                
                // if atlest one leftout
                let alertControl = UIAlertController(title: "Some Fields Missing", message: "Please Fill All Fields", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertControl.addAction(action)
                presentViewController(alertControl, animated: true, completion: nil)
 }
        
        
        
        
        
    }
    
    
    // MARK: - Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toPaymentViewController" {
            
            let dvc = segue.destinationViewController as? PaymentViewController
            
            dvc?.shippingAddress = self.shippingAddress
            
            
        }
        
        
    }
    
    //   MARK:- Keyboard Methods
    
  
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        self.view.frame.origin.y = 0
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        return true
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    
    func keyboardWillAppear(notification : NSNotification ) {
        print("keyboardWillAppear")
        if let userInfo = notification.userInfo {
            if let keyboardRect =  userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue {
                compareTheYpositionAndShift(keyboardRect)
            }
        }
        
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing")
        print(textField.frame)
        // currentTextField.frame = textField.frame
        
        if textField == countyTextField || textField == postCodeTextField || textField == phoneTextField {
            
            scrollView.setContentOffset(CGPoint(x: 0, y: 200), animated: true)
        } else {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
        
    }
    
    
    func compareTheYpositionAndShift(rectOfKeyboard : CGRect) {
        print("compareTheYpositionAndShift")
        //  print(currentTextField.frame)
        //  print(currentTextField.bounds.origin.y)
        print(rectOfKeyboard.origin)
        if currentTextField.frame.origin.y < rectOfKeyboard.origin.y && currentTextField.frame.origin.y > rectOfKeyboard.origin.y - 60 {
            
            self.view.frame.origin.y -= 60
            print("inside the code and current text field y = \(currentTextField.frame.origin.y) and keyboard y = \(rectOfKeyboard.origin.y) and view after edited = \(self.view.frame.origin.y) )")
            
        } else {
            self.view.frame.origin.y = 0
        }
    }
    
    
    func keyboardWillHide(notification : NSNotification) {
        self.view.frame.origin.x = 0
        self.view.frame.origin.y = 0
        
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        print(textField.frame)
        return true
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touches")
        self.view.endEditing(true)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}





