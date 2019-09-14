//
//  CustomTour.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation


class CustomTour {
    var places = [Place]()
    
    func addPlace(_ place: Place) {
        places.append(place)
    }
    
    func removePlace(at index: Int) {
        places.remove(at: index)
    }
}
