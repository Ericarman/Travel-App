//
//  PlaceDownloader.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/12/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PlaceDownloader {
    static var shared = PlaceDownloader()
    
    private let db = Firestore.firestore()
    
    func getPlace(by id: String, completion: @escaping ([String: Any]?) -> Void) {
        db.collection("Places").document("\(id)").getDocument { (snapshot, error) in
            guard let snapshot = snapshot,
                let document = snapshot.data() else {
                    completion(nil)
                    return
            }
            completion(document)
            
        }
    }
}
