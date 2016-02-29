//
//  PaymentViewController.swift
//  Moltin Ecommerce App
//
//  Created by Deepthi Kaligi on 22/02/2016.
//  Copyright © 2016 MightyDevelopers. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cardNumberLabel : UILabel!
    @IBOutlet weak var exipryMonthLabel : UILabel!
    @IBOutlet weak var expiryYearLabel : UILabel!
    @IBOutlet weak var cvvLabel : UILabel!
    
    @IBOutlet weak var cardNumberTextField : UITextField!
    @IBOutlet weak var expiryMonthTextField : UITextField!
    @IBOutlet weak var expiryYearTextField : UITextField!
    @IBOutlet weak var cvvTextField : UITextField!
    
    
    
    
    var shippingAddress = [String : String]()
    
    private var paymentDetails = [String : String]()
    
    // used for scrolling view up when keyboard appears
    var kbHeight: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.title = "Payment Page"
    
        // for dismissing the keyboard once return pressed
     cardNumberTextField.delegate = self
     expiryMonthTextField.delegate = self
        expiryYearTextField.delegate = self
        cvvTextField.delegate = self
        
    }

    @IBAction func payButtonPressed(sender : UIButton ) {
        
        if cardNumberTextField.text != "" &&
             expiryMonthTextField.text != "" &&
            expiryYearTextField.text != "" &&
            cvvTextField.text != ""   {
        // fill the payment Details Dictionary and pass it to gateway 
    paymentDetails["number"] = cardNumberTextField.text
    paymentDetails["expiry_month"] = expiryMonthTextField.text!
    paymentDetails["expiry_year"] = expiryYearTextField.text
    paymentDetails["cvv"] = cvvTextField.text
                
    
    let paymentParameters : [NSObject : AnyObject] = ["data" : paymentDetails]
    let orderId  = shippingAddress["orderID"]!
  
Moltin.sharedInstance().checkout.paymentWithMethod("purchase", order: orderId, parameters: paymentParameters, success: { (response) -> Void in
    // Payment successful...
    print("Payment successful: \(response)")
    
    let alertControl = UIAlertController(title: "Payment Successful", message: "Your payment is succesful", preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertControl.addAction(action)
    self.presentViewController(alertControl, animated: true, completion: nil)
    
    }, failure: { (response, error) -> Void in
        // Payment error
        print("Payment error: \(error)")
        
        let alertControl = UIAlertController(title: "Payment Failed", message: "Please Try Again Later", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertControl.addAction(action)
        self.presentViewController(alertControl, animated: true, completion: nil)
})
                
                
        } else {
           
    let alertControl = UIAlertController(title: "Some Fields Missing", message: "Please Fill All Fields", preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertControl.addAction(action)
    presentViewController(alertControl, animated: true, completion: nil)
            
        }
        
        
        
 }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        self.animateTextField(false)
 
    }
    
  // code for moving view up as keyboard appears 

    func registerForKeyboardNotifications() {
        
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil )
        
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
    }
   
    func deregisterFromKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
    
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterFromKeyboardNotifications()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.animateTextField(false)

        return true
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                kbHeight = keyboardSize.height / 3.0
                self.animateTextField(true)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func animateTextField(up: Bool) {
   //     var movement = (up ? -kbHeight : kbHeight)
        if up {
        UIView.animateWithDuration(0.3, animations: {
        self.view.frame.origin.y = -self.kbHeight
//            self.view.frame = CGRectOffset(self.view.frame, 0, -self.kbHeight)
        })
        } else {
           
            UIView.animateWithDuration(0.3, animations: {
//                self.view.frame = CGRectOffset(self.view.frame, 0, self.kbHeight)
                self.view.frame.origin.y = 0

            })

        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}
