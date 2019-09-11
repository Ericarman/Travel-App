//
//  User.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/9/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct User {
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    
    init?(data: QueryDocumentSnapshot) {
        let data = data.data()
        
        guard let firstName = data["firstName"] as? String,
        let lastName = data["lastName"] as? String,
        let email = data["email"] as? String,
            let phoneNumber = data["phone"] as? String else {
                return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        
    }
    
}
