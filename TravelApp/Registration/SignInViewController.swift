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
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var enterAsGuestButton: UIButton!
    @IBOutlet var RegisterNewAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Error message
                print(error!.localizedDescription)
            } else {
                // Go to home screen
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
                self.view.window?.rootViewController = homeVC
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
}
