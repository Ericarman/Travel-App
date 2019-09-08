//
//  SignInViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/6/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBAction func emailAddres(_ sender: UITextField) {
        if emailAddress.isEditing == true{
            emailAddress.isHighlighted = false
        }
    }
    @IBAction func password(_ sender: UITextField) {
        if password.isEditing == true{
            password.isHighlighted = false
        }
    }
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailAddress.borderStyle = .none
        password.borderStyle = .none
    
    }
}
