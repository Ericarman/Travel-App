//
//  AttractionTableViewCellDelegate.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/20/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

protocol AttractionTableViewCellDelegate: class {
    func addButtonTapped(place: PlaceViewModel)
}
