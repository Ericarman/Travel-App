//
//  UserViewModel.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/9/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class UserViewModel {
    private var user: User?
    
    func signIn(email: String, Password: String, complition: @escaping (User?) -> Void) {
        Registration.shared.signInUser(email: email, password: Password) { (user) in
            if let user = user {
                self.user = user
                complition(user)
            } else {
                complition(nil)
            }
        }
    }
    
    func signUp(firstName: String, lastName: String, phone: String, email: String, password: String, confirmPassword: String, completion: @escaping (_ error: String?) -> Void ) {

        if let error = Utilities.shared.validateFields(firstName: firstName, lastName: lastName, phone: phone, email: email, password: password, confirmPassword: confirmPassword) {
            
            completion(error)
            
        } else {
            Registration.shared.signUpNewUser(firstName: firstName, lastName: lastName, phone: phone, email: email, password: password) { success in
                completion(nil)
            }
        }
    }
    
    
    
}
