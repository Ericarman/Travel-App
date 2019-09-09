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

    
    func signInUser(email: String, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Error message
                print(error!.localizedDescription)
            } else if let result = result {
                self.getUserData(uid: result.user.uid, complition: { (user) in
                    if let user = user {
                        completion(user)
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
                    self.setUserData(firstName, lastName, email, phone, result.user.uid)
                    
                    completion(true)
                }
            } else {
                completion(false)
            }
        }
    }
    
    private func setUserData(_ firstName: String, _ lastName: String,_ email: String, _ phone: String, _ uid: String) {
        db.collection("Users").addDocument(data: ["firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "uid": uid], completion: { (error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        })
    }
    
    private func getUserData(uid: String, complition: @escaping (User?) -> Void ) {

        db.collection("Users").whereField("uid", isEqualTo: uid).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                let document = snapshot!.documents.first
                if let documentDic = document?.data() {
                    guard let firstName = documentDic["firstName"] as? String,
                        let lastName = documentDic["lastName"] as? String,
                        let email = documentDic["email"] as? String,
                        let phone = documentDic["phone"] as? String else {
                        complition(nil)
                        return
                    }
                    let user = User(firstName: firstName, lastName: lastName, email: email, phoneNumber: phone)
                    
                    complition(user)
                }
                
            }
        }
        
        complition(nil)
    }
    
}
