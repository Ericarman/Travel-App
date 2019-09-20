//
//  PlaceListViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class PlaceListViewModel {
    private var customTour = CustomTour()
    
    var placesViewModels = [PlaceViewModel]()
    var selectedPlacesViewModels = [PlaceViewModel]()
    
    
    func getPlaces(completion: @escaping ([PlaceViewModel]?) -> Void ) {
        
        PlaceListDownloader.shared.getPlaces { (placesDict) in
            guard let placesDict = placesDict else { completion(nil); return }
            
            let group = DispatchGroup()
            for (id, place) in placesDict {
                guard let name = place["name"] as? String,
                    let imageURL = place["image"] as? String else { completion(nil); return }
                print(imageURL)
                
                group.enter()
                ImageDownloader.shared.getImage(from: imageURL, completion: { (data) in
                    guard let data = data else { completion(nil); return }
                    
                    let image = UIImage(data: data)!
                    let place = Place(id: id, name: name, image: image)
                    let viewModel = PlaceViewModel(place: place)
                    
                    self.placesViewModels.append(viewModel)
                    group.leave()
                })
            }
            
            group.notify(queue: DispatchQueue.main, execute: {
                completion(self.placesViewModels)
            })
        }
    }
    
    func addPlaceToCollectionView(place: PlaceViewModel) {
        //TODO: (Eric)
        if !selectedPlacesViewModels.contains(place) {
            selectedPlacesViewModels.append(place)
        }
    }
}
