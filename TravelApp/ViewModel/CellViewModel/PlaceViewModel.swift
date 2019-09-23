//
//  PlaceViewModel.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class PlaceViewModel: Equatable {
    private let place: Place
    private var image: UIImage?
   
    init(place: Place) {
        self.place = place
    }
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        if let image = image {
            completion(image)
        }
        ImageDownloader.shared.getImage(from: place.imageUrl) { (data) in
            guard let data = data else { completion(nil); return }
            let image = UIImage(data: data)
            self.image = image
            completion(image)
        }
    }
    
    static func == (lhs: PlaceViewModel, rhs: PlaceViewModel) -> Bool {
        return lhs.place.id == rhs.place.id
    }
    
    var placeName: String {
        return self.place.name
    }
}
