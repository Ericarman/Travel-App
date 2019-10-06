//
//  AccountViewController.swift
//  TravelApp
//
//  Created by Tigran on 10/5/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit
import Firebase
class AccountViewController: UIViewController {
    
    
    @IBOutlet weak var changeEmail: UITextField!
    @IBOutlet weak var changePassword: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    var edited = false
    @IBAction func EditProfile(_ sender: Any) {
        if edited == false {
        changePassword.isEnabled = true
        changeEmail.isEnabled = true
        lastName.isEnabled = true
        firstName.isEnabled = true
        
        changePassword.borderStyle = .roundedRect
        changeEmail.borderStyle = .roundedRect
        lastName.borderStyle = .roundedRect
        firstName.borderStyle = .roundedRect
        edited = true
        } else {
            changePassword.isEnabled = false
            changeEmail.isEnabled = false
            lastName.isEnabled = false
            firstName.isEnabled = false
            
            changePassword.borderStyle = .none
            changeEmail.borderStyle = .none
            lastName.borderStyle = .none
            firstName.borderStyle = .none
            edited = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromFireBase()
    }
    
    func getDataFromFireBase() {
        
        let concurrentPhotoQueue = DispatchQueue.global(qos: .userInitiated)
        concurrentPhotoQueue.async {
            
            let db = Firestore.firestore()
            db.collection("Users").whereField("firstName", isEqualTo: "gerasim").getDocuments { (snapshot, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    for document in (snapshot?.documents)! {
                        self.firstName.text = document.data()["firstName"] as? String
                        self.lastName.text  = document.data()["lastName"] as? String
                        self.changeEmail.text = document.data()["email"] as? String
                        self.changePassword.text = document.data()["uid"] as? String
                    }
                }
            }
        }
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
