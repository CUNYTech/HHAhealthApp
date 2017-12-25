////
////  UpdateAccountViewController.swift
////  YesReadyApp
////
////  Created by Tishaun Bristol on 12/6/17.
////  Copyright © 2017 YesReadyApp. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//
//class UpdateAccountViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate {
//
//    
//   // @IBOutlet var phoneField: UITextField!
//   // @IBOutlet weak var help: UIImageView!
//
//    @IBOutlet var photo: UIImageView!
//
//    @IBAction func ChangePic(_ sender: Any) {
//        let image = UIImagePickerController()
//        image.delegate = self
//        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
//
//        image.allowsEditing = false
//
//        self.present(image, animated: true)
//        {
//            //After it's completed
//        }
//    }
//    
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
//
//            photo.image = image
//        }
//        else{
//            //Error message
//        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
//
//
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        photo.layer.cornerRadius = photo.frame.size.width/2
//        photo.clipsToBounds = true
//        //self.phoneField.delegate = self
//
//
//    }
//    //Hide keyboard when user touches outside keyboard
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    //Presses return key, hide the keyboard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//      //  phoneField.resignFirstResponder()
//        return(true)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//    }
//
//    
//
//
//}
//
//
//
//
//
//
//
//
//

