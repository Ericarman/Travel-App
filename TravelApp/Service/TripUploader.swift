//
//  TripUploader.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/30/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Firebase

class TripUploader {
    static let shared: TripUploader = TripUploader()
    
    private let db = Firestore.firestore()

    func setTrip(tourID: String, WiFi: Bool, AC: Bool, completion: @escaping (_ error: Error?) -> Void) {
        db.collection("Trips").addDocument(data: ["Tour": tourID,
                                                 "WiFi": WiFi,
                                                 "AC": AC]) { (error) in
                                                    completion(error)
        }
    }
}
