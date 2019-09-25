//
//  FavoriteVC+HomeCollectionViewCellDelegate.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/16/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

extension FavoritesViewController: HomeCollectionViewCellDelegate {
    func tour(with cell: HomeCollectionViewCell) {
        guard let indexPath = favoritesCollectionView.indexPath(for: cell),
            let HomeVC = self.tabBarController?.viewControllers![0] as? HomeViewController
            else {
                return
        }
        HomeVC.collectionView.reloadData()
        cell.viewModel.isFavorite.toggle()
        cell.togglefavoriteImage()
        if !cell.viewModel.isFavorite {
            for (index, element) in self.toursViewModel.tours.enumerated() {
                print(element.id)
                print(cell.viewModel.id)
                if element == cell.viewModel {
                    self.toursViewModel.tours.remove(at: index)
                    self.favoritesCollectionView.deleteItems(at: [indexPath])
                    break
                }
            }
        }
    }
    
}
