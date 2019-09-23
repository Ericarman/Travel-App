//
//  SelectedPlacesCollectionViewCellDelegate.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

protocol SelectedPlacesCollectionViewCellDelegate: class {
    func removeTapped(place: PlaceViewModel)
}
