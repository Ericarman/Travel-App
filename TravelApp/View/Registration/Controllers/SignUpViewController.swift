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
    
    private let userViewModel = UserViewModel()

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
    
    @IBAction func signUpTapped(_ sender: Any) {

            guard let firstName = firstNameField.text,
                let lastName = lastNameField.text,
                let email = emailAddressField.text,
                let phone = phoneField.text,
                let password = passwordField.text,
                let confirmPassword = confirmPasswordField.text else {
                    return
            }
            
        userViewModel.signUp(firstName: firstName, lastName: lastName, phone: phone, email: email, password: password, confirmPassword: confirmPassword) { error in
            if let error = error {
                self.errorLabel.text = error
            } else {
                self.errorLabel.text = "Successs!!"
                guard let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as? SignInViewController else {
                    return
                }
                self.present(signInVC, animated: true, completion: nil)
            }
        }
            
    }
}
