//
//  PlaceDownloader.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/12/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct PlaceDownloader {
    static var shared = PlaceDownloader()
    
    func getPlaces(from reference: DocumentReference, completion: @escaping ([String: Any]?) -> Void) {
        reference.collection("Places").getDocuments { (querySnapshot, error) in
            if error != nil {
                completion(nil)
            } else if let snapshot = querySnapshot {
                var places = [String: Any]()
                for document in snapshot.documents {
                    let name = document["name"] as! String
                    places[document.documentID] = ["name": name]
                }
                completion(places)
            }

        }
    }
}
