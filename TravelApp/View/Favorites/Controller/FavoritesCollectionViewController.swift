//
//  FavoritesCollectionViewController.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/13/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class FavoritesCollectionViewController: UICollectionViewController {
    
    private let toursViewModel = TourListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toursViewModel.tours.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        cell.setup(with: self.toursViewModel.tours[indexPath.row])
    
        return cell
    }
    
    ///MARK: HomeViewControllerDelegate
    
    func addFavoritetour(_ tour: TourViewModel) {
        self.toursViewModel.tours.append(tour)
    }

}
