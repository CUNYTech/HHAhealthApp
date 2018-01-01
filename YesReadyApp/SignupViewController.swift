//
//  SignupViewController.swift
//  YesReadyApp
//
//  Created by Tishaun Bristol on 12/6/17.
//  Copyright © 2017 YesReadyApp. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController, UITextFieldDelegate{
    
    
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func returnLoginButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")as! ViewController
        self.present(vc, animated: true, completion: nil)
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
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileinfo")as! UpdateAccountViewController
                    self.present(vc, animated: true, completion: nil)
                 
                }
            else {
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
        self.passwordField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key, hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
        return(true)
    }
    
}
