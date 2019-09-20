//
//  FavoriteVC+HomeVCDelegate.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/16/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

extension FavoritesViewController: HomeViewControllerDelegate {
    func addToFavorites(tour: TourViewModel) {
        if !self.toursViewModel.tours.contains{ $0 == tour} {
            self.toursViewModel.tours.append(tour)
        }
    }
    
    func deleteFromFavorites(tour: TourViewModel) {
        for (index, element) in self.toursViewModel.tours.enumerated() {
            if element == tour {
                self.toursViewModel.tours.remove(at: index)
                break
            }
        }
    }
}
