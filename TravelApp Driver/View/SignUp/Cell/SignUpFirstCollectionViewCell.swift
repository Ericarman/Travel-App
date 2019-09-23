//
//  SignUpFirstCollectionViewCell.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class SignUpFirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
