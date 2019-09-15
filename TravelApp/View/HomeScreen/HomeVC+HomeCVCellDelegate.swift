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
        guard let row = collectionView.indexPath(for: cell)?.row else {
            return
        }
        let tourViewModel = self.toursViewModel.tours[row]
    }

}
