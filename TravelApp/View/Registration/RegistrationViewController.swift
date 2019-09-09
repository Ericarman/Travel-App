//
//  RegistrationViewController.swift
//  TravelApp
//
//  Created by Tigran on 9/8/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var texts: UITextField?
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if firstName.isEditing == true{
            firstName.isHighlighted = false
        }
        else if lastName.isEditing == true{
            lastName.isHighlighted = false
        }
        else if emailAddress.isEditing == true{
            emailAddress.isHighlighted = false
        }
        else if phoneNUmber.isEditing == true{
            phoneNUmber.isHighlighted = false
        }
        else if password.isEditing == true{
            password.isHighlighted = false
        }
        else if confirmPassword.isEditing == true{
            confirmPassword.isHighlighted = false
        }
        return true
    }
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phoneNUmber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        texts?.delegate = self
        firstName.borderStyle = .none
        lastName.borderStyle = .none
        phoneNUmber.borderStyle = .none
        emailAddress.borderStyle = .none
        password.borderStyle = .none
        confirmPassword.borderStyle = .none
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
