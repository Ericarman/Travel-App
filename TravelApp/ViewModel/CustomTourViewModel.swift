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
    
    func getPlaces(completion: @escaping ([Place]?) -> Void ) {
        //TODO: (Eric)
        //Get places from Firebase
        PlaceDownloader.shared.getPlaces(from: <#T##DocumentReference#>, completion: <#T##([String : Any]?) -> Void#>)
    }
    
    //TODO: (Eric)
    //Update Model from ViewModel
}
