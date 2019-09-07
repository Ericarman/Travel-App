//
//  SignUpViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/6/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func validateFields() -> String? {
        guard firstNameField.text! != "" ||
        lastNameField.text! != "" ||
        emailAddressField.text! != "" ||
        phoneField.text! != "" ||
        passwordField.text! != "" ||
        confirmPasswordField.text! != "" else {
            return "please fill all fields"
        }
        
        if passwordField.text! != confirmPasswordField.text! {
            return "passwords are note match"
        }
        
        if !Utilities.isPasswordValid(passwordField.text!) {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        if !Utilities.isEmailValid(emailAddressField.text!) {
            return "email address is not valid"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //Validate fields
        let error = validateFields()
        
        if error != nil {
            errorLabel.text = error!
        } else {
            let firstName = firstNameField.text!
            let lastName = lastNameField.text!
            let email = emailAddressField.text!
            let phone = phoneField.text!
            let password = passwordField.text!
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    if let result = result {
                        
                        let db = Firestore.firestore()
                        
                        db.collection("Users").addDocument(data: ["firstName": firstName,
                                                                  "lastName": lastName,
                                                                  "phone": phone,
                                                                  "uid": result.user.uid], completion: { (error) in
                                                                    if let error = error {
                                                                        print(error.localizedDescription)
                                                                    }
                        })
                    }
                }
            }
        }
    }
}
