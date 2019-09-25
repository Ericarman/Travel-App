//
//  HomeCV+HomeCVCellDelegate.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/15/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

extension HomeViewController: HomeCollectionViewCellDelegate {
    func tour(with cell: HomeCollectionViewCell) {
        cell.viewModel.isFavorite.toggle()
        cell.togglefavoriteImage()
        if cell.viewModel.isFavorite {
            self.delegate.addToFavorites(tour: cell.viewModel)
        } else {
            self.delegate.deleteFromFavorites(tour: cell.viewModel)
        }
    }

}
