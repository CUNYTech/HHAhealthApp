//
//  SignupViewController.swift
//  YesReady
//
//  Created by Manzala Kazmi on 10/5/17.
//  Copyright © 2017 HealthCare. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    
   
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func returnLoginButton(_ sender: Any) {
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginID")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    
    @IBAction func signupButton(_ sender: Any) {
       
        if emailField.text == "" || emailField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        else {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                 /*   let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                */
 
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
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
