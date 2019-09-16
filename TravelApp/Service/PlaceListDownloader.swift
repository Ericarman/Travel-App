//
//  PlaceListDownloader.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

class PlaceListDownloader {
    static var shared = PlaceListDownloader()
    
    private let db = Firestore.firestore()
    
    func getTourPlaces(from reference: DocumentReference, completion: @escaping ([String: [String: Any]]?) -> Void) {
        reference.getDocument { (snapshot, error) in
            guard let snapshot = snapshot,
                let data = snapshot.data(),
                let placeIds = data["places"] as? Array<String> else {
                    completion(nil)
                    return
            }
            
            let group = DispatchGroup()
            var places = [String: [String: Any]]()
            for id in placeIds {
                group.enter()
                PlaceDownloader.shared.getPlace(by: id, completion: { (placeDic) in
                    guard let placeDic = placeDic else {
                        completion(nil)
                        return
                    }
                    places[id] = placeDic
                    group.leave()
                })
            }
            group.notify(queue: DispatchQueue.main, execute: {
                completion(places)
            })
            
        }
    }
    
    func getPlaces(completion: @escaping ([String: [String: Any]]?) -> Void) {
        let ref = db.collection("Places")
        
        var places = [String: [String: Any]]()
        
        DispatchQueue.global().async {
            ref.getDocuments { (querySnapshot, error) in
                if error != nil {
                    print("Error getting documents")
                } else {
                    for document in querySnapshot!.documents {
                        places[document.documentID] = document.data()
                    }
                    completion(places)
                }
            }
        }
    }
}
