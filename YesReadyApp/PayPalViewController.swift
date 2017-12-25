//
//  PaypalViewController.swift
//  YesReadyApp
//
//  Created by Tishaun Bristol on 12/6/17.
//  Copyright © 2017 YesReadyApp. All rights reserved.
//

import UIKit

import UIKit

class PayPalViewController: UIViewController,UITextFieldDelegate ,PayPalPaymentDelegate {
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    
    var payPalConfig = PayPalConfiguration() // default
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set up payPalConfig
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "YesReady Co."
        
        //Paypal Privacy Policy
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        //Preferred Language
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        
        //use registered shipping address
        payPalConfig.payPalShippingAddressOption = .payPal
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PayPalMobile.preconnect(withEnvironment: environment)
    }
    
    @IBAction func payBtnPressed(_ sender: Any) {
        
        
        //Items being sold
        
        let item1 = PayPalItem(name: "Old jeans with holes", withQuantity: 2, withPrice: NSDecimalNumber(string: "84.99"), withCurrency: "USD", withSku: "Hip-0037")
        let item2 = PayPalItem(name: "Free rainbow patch", withQuantity: 1, withPrice: NSDecimalNumber(string: "0.00"), withCurrency: "USD", withSku: "Hip-00066")
        let item3 = PayPalItem(name: "Long-sleeve plaid shirt (mustache not included)", withQuantity: 1, withPrice: NSDecimalNumber(string: "37.99"), withCurrency: "USD", withSku: "Hip-00291")
        
        let items = [item1, item2, item3]
        let subtotal = PayPalItem.totalPrice(forItems: items)
        
        // Optional: include payment details
        let shipping = NSDecimalNumber(string: "5.99")
        let tax = NSDecimalNumber(string: "2.50")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.adding(shipping).adding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Task 1", intent: .sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable) {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self as! PayPalPaymentDelegate)
            present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            // This particular payment will always be processable. If, for
            // example, the amount was negative or the shortDescription was
            // empty, this payment wouldn't be processable, and you'd want
            // to handle that here.
            print("Payment not processalbe: \(payment)")
        }
    }
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
            
            
        })
    }
    
    @IBAction func homeBtnPress(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "posttask")as! TaskViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    //Hide keyboard when user touch outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Press Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                return(true)
    }
    

    
}
