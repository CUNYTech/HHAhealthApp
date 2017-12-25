//
//  PasswordResetViewController.swift
//  YesReadyApp
//
//  Created by Tishaun Bristol on 12/6/17.
//  Copyright © 2017 YesReadyApp. All rights reserved.
//

import UIKit
import FirebaseAuth
class PasswordResetViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBAction func returnLoginButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome") as! ViewController
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
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
        self.emailField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Hide keyboard when user touch outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Press Return Key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        return(true)
    }


}


       


