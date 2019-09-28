//
//  TourViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/17/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit
import Firebase

class TourViewModel: Equatable {
    private var tour: Tour
    private var places: [PlaceViewModel]
    
    init?(snapshot: QueryDocumentSnapshot, places: [(id: String, place: [String : Any])]) {
        let data = snapshot.data()
        let id = snapshot.documentID
        let name = data["name"] as! String
        let isFavorite = data["isFavorite"] as! Bool
        
        var placeList = [PlaceViewModel]()
        for (id, place) in places {
            guard let name = place["name"] as? String,
                let imageUrl = place["image"] as? String else {
                    return nil
            }
            let place = PlaceViewModel(place: Place(id: id, name: name, imageUrl: imageUrl))
            placeList.append(place)
        }
        self.tour = Tour(id: id, name: name, isFavorite: isFavorite)
        self.places = placeList
        
    }
    
    var id: String {
        return self.tour.id
    }
    
    var tourName: String {
        return self.tour.name
    }
    
    var tourPlaces: [PlaceViewModel] {
        get {
            return self.places
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
