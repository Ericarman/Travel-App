//
//  TourViewModel.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

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
                    let isFavorite = data["isFavorite"] as! Bool
                    
                    group.enter()
                    PlaceListDownloader.shared.getTourPlaces(from: document.reference, completion: { (placeList) in
                        guard let placeList = placeList else {
                            completion(nil)
                            return
                        }
                        var places = [Place]()
                        let group2 = DispatchGroup()
                        for (id, place) in placeList {
                            guard let name = place["name"] as? String,
                                let imageUrl = place["image"] as? String else {
                                return
                            }
                            group2.enter()
                            ImageDownloader.shared.getImage(from: imageUrl, completion: { (data) in
                                guard let data = data else {
                                    completion(nil)
                                    return
                                }
                                //TODO: load image
                                let image = UIImage(data: data)
                                let place = Place(id: id, name: name, image: image!)
                                places.append(place)
                                group2.leave()
                            })
                        }
                        group2.notify(queue: DispatchQueue.main) {
                            tour = Tour(id: document.documentID, name: name, isFavorite: isFavorite, places: places)
                            self.tours.append(TourViewModel(tour: tour))
                            group.leave()
                        }
                    })
                }
                group.notify(queue: DispatchQueue.main) {
                    completion(self.tours)
                }
            }
        })
    }
}


