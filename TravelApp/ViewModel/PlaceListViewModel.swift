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
            
            for (id, data) in placesDict {
                guard let name = data["name"] as? String,
                    let imageURL = data["image"] as? String else { completion(nil); return }
                let place = Place(id: id, name: name, imageUrl: imageURL)
                self.placesViewModels.append(PlaceViewModel(place: place))
                
            }
            
            completion(self.placesViewModels)
            
        }
    }
    
    func addPlaceToCollectionView(place: PlaceViewModel) {
        //TODO: (Eric)
        if !selectedPlacesViewModels.contains(place) {
            selectedPlacesViewModels.append(place)
        }
    }
    
    func removePlaceFromCollectionView(place: PlaceViewModel) {
        for index in 0..<selectedPlacesViewModels.count {
            if place.place.id == selectedPlacesViewModels[index].place.id {
                selectedPlacesViewModels.remove(at: index)
                break
            }
        }
    }
}
