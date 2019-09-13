//
//  FavoritesCollectionViewController.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/13/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class FavoritesCollectionViewController: UICollectionViewController {
    
    var tours = [Tour]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tours.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        cell.setup(name: tours[indexPath.row].name)
    
        return cell
    }
    
    ///MARK: HomeViewControllerDelegate
    
    func addFavoritetour(_ tour: Tour) {
        self.tours.append(tour)
    }

}
