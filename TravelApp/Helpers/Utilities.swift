//
//  Utilities.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/7/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
        return passwordTest.evaluate(with: password)
        
    }
    
    static func isEmailValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return passwordTest.evaluate(with: password)
        
    }
    
    static func isPhoneNumberValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[0][0-9]{8}$")
        return passwordTest.evaluate(with: password)
        
    }
    
}


