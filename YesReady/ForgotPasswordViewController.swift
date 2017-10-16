//
//  ForgotPasswordViewController.swift
//  YesReady
//
//  Created by Manzala Kazmi on 10/5/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    
    @IBAction func returnLoginButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginID")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        if self.emailField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            }
        else {
            Auth.auth().sendPasswordReset(withEmail: self.emailField.text!,completion: { error in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
