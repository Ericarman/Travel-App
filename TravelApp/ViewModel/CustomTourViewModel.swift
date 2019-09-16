//
//  CustomTourViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

class CustomTourViewModel {
    private var customTour = CustomTour()
    var cellViewModels = [AttractionViewModel]()
    
    func getPlaces(completion: @escaping ([AttractionViewModel]?) -> Void ) {
        
        PlaceListDownloader.shared.getPlaces { (placesDict) in
            guard let placesDict = placesDict else { completion(nil); return }
            let group = DispatchGroup()
            for (id, place) in placesDict {
                group.enter()
                guard let name = place["name"] as? String else { return }
                let place = Place(id: id, name: name)
                let viewModel = AttractionViewModel(place: place)
                print(viewModel.description)
                self.cellViewModels.append(viewModel)
                group.leave()
            }
            
            group.notify(queue: DispatchQueue.main, execute: {
                completion(self.cellViewModels)
            })
        }
    }
}
