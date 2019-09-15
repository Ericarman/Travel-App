//
//  TourViewModel.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class TourListViewModel {
    var tours = [TourViewModel]()
    
    func getTours(completion: @escaping ([TourViewModel]?) -> Void) {
        
        ToursDownloader.shared.getTours(completion: { (querySnapshot) in
            if let querySnapshot = querySnapshot {
                let group = DispatchGroup()
                for document in querySnapshot {
                    var tour: Tour!
                    let data = document.data()
                    let name = data["name"] as! String
                    
                    group.enter()
                    PlaceListDownloader.shared.getTourPlaces(from: document.reference, completion: { (placeList) in
                        guard let placeList = placeList else {
                            completion(nil)
                            return
                        }
                        var places = [Place]()
                        for (id, place) in placeList {
                            guard let name = place["name"] as? String else {
                                return
                            }
                            let place = Place(id: id, name: name)
                            places.append(place)
                        }
                        tour = Tour(name: name, places: places)
                        self.tours.append(TourViewModel(tour: tour))
                        group.leave()
                    })
                }
                group.notify(queue: DispatchQueue.main) {
                    completion(self.tours)
                }
            }
        })
    }
}

class TourViewModel {
    private var tour: Tour
    
    init(tour: Tour) {
        self.tour = tour
    }
    
    var tourName: String {
        return self.tour.name
    }
    
    var tourPlaces: [Place] {
        return self.tour.places
    }
    
}

