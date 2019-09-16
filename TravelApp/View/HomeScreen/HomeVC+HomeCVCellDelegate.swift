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
        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        cell.viewModel.isFavorite.toggle()
        self.collectionView.reloadItems(at: [indexPath])

        if cell.viewModel.isFavorite {
            self.delegate.addToFavorites(tour: cell.viewModel)
        } else {
            self.delegate.deleteFromFavorites(tour: cell.viewModel)
        }
    }

}
