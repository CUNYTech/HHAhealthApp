//
//  TaskViewController.swift
//  YesReadyApp
//
//  Created by Tishaun Bristol on 12/6/17.
//  Copyright © 2017 YesReadyApp. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITextFieldDelegate {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postBtnPress(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "paypal") as! PayPalViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    

    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
