//
//  ToursDownloader.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ToursDownloader {
    static let shared = ToursDownloader()
    
    private let db = Firestore.firestore()
    
    func getTours(completion: @escaping (_ data: [QueryDocumentSnapshot]?) -> Void) {
        db.collection("Tours").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(nil)
            } else if let querySnapshot = querySnapshot?.documents {
                completion(querySnapshot)
            }
        }
    }
}

