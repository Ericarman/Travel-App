//
//  Utilities.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/7/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class Utilities {
    
    static let shared = Utilities()
    
    func validateFields(firstName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String) -> String? {
        guard firstName != "" ||
            lastName != "" ||
            email != "" ||
            phone != "" ||
            password != "" ||
            confirmPassword != "" else {
                return "please fill all fields"
        }
        
        if password != confirmPassword {
            return "passwords are note match"
        }
        
        if self.isPasswordValid(password) {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        if self.isEmailValid(email) {
            return "email address is not valid"
        }
        
        return nil
    }
    
    private func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
        return passwordTest.evaluate(with: password)
        
    }
    
    private func isEmailValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return passwordTest.evaluate(with: password)
        
    }
    
    private func isPhoneNumberValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[0][0-9]{8}$")
        return passwordTest.evaluate(with: password)
        
    }
    
}


