//
//  UpdateAccountViewController.swift
//  YesReadyApp
//
//  Created by Tishaun Bristol on 12/6/17.
//  Copyright © 2017 YesReadyApp. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UpdateAccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    @IBOutlet var myImg: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumbField: UITextField!
    @IBOutlet var languageTextField: UITextField!
    
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.nameTextField.delegate = self
        self.phoneNumbField.delegate = self
        self.languageTextField.delegate = self
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePhoto(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImg.contentMode = .scaleToFill
            myImg.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveInfoBtn(_ sender: UIButton) {
        
        //add to firebase
        
        
    }
    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key, hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        phoneNumbField.resignFirstResponder()
        languageTextField.resignFirstResponder()
        
        return(true)
    }
    
    
}
