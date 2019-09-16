//
//  SignInViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/6/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    private let userViewModel = UserViewModel()
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var enterAsGuestButton: UIButton!
    @IBOutlet var RegisterNewAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
    
    }

    @IBAction func emailAddres(_ sender: UITextField) {
        if emailTextField.isEditing == true {
            emailTextField.isHighlighted = false
        }
    }
    @IBAction func password(_ sender: UITextField) {
        if passwordTextField.isEditing == true {
            passwordTextField.isHighlighted = false
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let homeVC = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateViewController(withIdentifier: "TabBar")
        
        self.present(homeVC, animated: true, completion: nil)
        
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        userViewModel.signIn(email: email, Password: password) { (user) in
            if let _ = user {
                let homeVC = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateViewController(withIdentifier: "TabBar")
                
                self.present(homeVC, animated: true, completion: nil)
            } else {
                //error
            }
        }
        
    }
}
