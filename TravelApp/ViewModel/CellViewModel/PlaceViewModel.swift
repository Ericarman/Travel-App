//
//  PlaceViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

struct PlaceViewModel: Equatable {
    let mainImage: UIImage
    let description: String
    let id: String
    
    init(place: Place) {
        self.description = place.name
        self.mainImage = place.image!
        self.id = place.id
    }
    
    static func == (lhs: PlaceViewModel, rhs: PlaceViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}
