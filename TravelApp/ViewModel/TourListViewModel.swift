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
                    group.enter()
                    PlaceListDownloader.shared.getTourPlaces(from: document.reference, completion: { (placeList) in
                        guard let placeList = placeList else {
                            completion(nil)
                            return
                        }
                        
                        if let tour = TourViewModel(snapshot: document, places: placeList) {
                            self.tours.append(tour)
                        } else {
                            completion(nil)
                        }
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


