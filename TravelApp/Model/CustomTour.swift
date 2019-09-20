//
//  CustomTour.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation


struct CustomTour {
    private(set) var places = [Place]()
    
    fileprivate mutating func addPlace(_ place: Place) {
        places.append(place)
    }
    
    fileprivate mutating func removePlace(at index: Int) {
        places.remove(at: index)
    }
}
