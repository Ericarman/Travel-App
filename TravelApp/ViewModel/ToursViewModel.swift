//
//  TourViewModel.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class ToursViewModel {
    var tours = [Tour]()
    
    func getTours(completion: @escaping ([Tour]?) -> Void) {
        
        ToursDownloader.shared.getTours { (toursDic) in
            ToursDownloader.shared.getTours(completion: { (querySnapshot) in
                if let querySnapshot = querySnapshot {
                    let group = DispatchGroup()
                    for document in querySnapshot {
                        
                        let name = document.data()["name"]
                        group.enter()
                        PlaceListDownloader.shared.getTourPlaces(from: document.reference, completion: { (placeList) in
                            guard let placeList = placeList else {
                                completion(nil)
                                return
                            }
                            for (id, place) in placeList {
                                
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
}
