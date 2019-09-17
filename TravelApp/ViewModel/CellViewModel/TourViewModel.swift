//
//  TourViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/17/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class TourViewModel: Equatable {
    private var tour: Tour
    
    init(tour: Tour) {
        self.tour = tour
    }
    
    var id: String {
        return self.tour.id
    }
    
    var tourName: String {
        return self.tour.name
    }
    
    var tourPlaces: [Place] {
        get {
            return self.tour.places
        }
    }
    
    var isFavorite: Bool {
        get {
            return self.tour.isFavorite
        }
        set {
            self.tour.isFavorite.toggle()
        }
    }
    
    static func == (lhs: TourViewModel, rhs: TourViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
