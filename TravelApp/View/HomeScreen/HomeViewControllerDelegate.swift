//
//  HomeViewControllerDelegate.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/16/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

protocol HomeViewControllerDelegate {
    func addToFavorites(tour: TourViewModel)
    func deleteFromFavorites(tour: TourViewModel)
}
