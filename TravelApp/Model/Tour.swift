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
    var places: [Place]
    
    init?(name: String, places: [Place]) {
        self.name = name
        self.places = places
        
    }
}
