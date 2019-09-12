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
                    for document in querySnapshot {
                        self.tours.append(Tour(data: document)!)
                    }
                    print(self.tours)
                    completion(self.tours)
                }
            })
        }
    }
}
