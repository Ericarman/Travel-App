//
//  PlaceViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

struct PlaceViewModel {
    let mainImage: UIImage
    let description: String
    
    init(place: Place) {
        self.description = place.name
        self.mainImage = #imageLiteral(resourceName: "garni")
    }
}
