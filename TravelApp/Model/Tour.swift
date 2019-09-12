//
//  Tour.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Tour {
    var name: String
    var placesRef: DocumentReference
    
    init?(data: QueryDocumentSnapshot) {
        let dataDic = data.data()
        
        guard let name = dataDic["name"] as? String else {
                return nil
        }
        
        self.name = name
        self.placesRef = data.reference
        
    }
}
