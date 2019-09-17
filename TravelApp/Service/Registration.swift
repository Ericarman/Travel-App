//
//  Registration.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/9/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class Registration {
    static let shared = Registration()
    
    private let db = Firestore.firestore()
    
    func signInUser(email: String, password: String, completion: @escaping (QueryDocumentSnapshot?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Error message
                print(error!.localizedDescription)
                completion(nil)
            } else if let result = result {
                self.getUserData(uid: result.user.uid, completion: { (data) in
                    if let data = data {
                        completion(data)
                    } else {
                        completion(nil)
                    }
                })
            }
        }
        
        completion(nil)
    }
    
    func signUpNewUser(firstName: String, lastName: String, phone: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                if let result = result {
                    self.setUserData(firstName, lastName, email, phone, result.user.uid, completion: { success in
                        if success {
                            completion(true)
                        } else {
                            completion(false)
                        }
                    })
                    
                }
            } else {
                completion(false)
            }
        }
    }
    
    private func setUserData(_ firstName: String, _ lastName: String, _ email: String, _ phone: String, _ uid: String, completion: @escaping (_ success: Bool) -> Void) {
        
        db.collection("Users").addDocument(data: ["firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "uid": uid], completion: { (error) in
            
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
            
        })
    }
    
    private func getUserData(uid: String, completion: @escaping (QueryDocumentSnapshot?) -> Void) {
        db.collection("Users").whereField("uid", isEqualTo: uid).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                let document = snapshot!.documents.first
                completion(document)
            }
        }
        completion(nil)
    }
    
}
