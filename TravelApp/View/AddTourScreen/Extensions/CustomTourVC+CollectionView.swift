//
//  CustomTourVC+CollectionView.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/20/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

extension CustomTourViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: -> CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeListViewModel.selectedPlacesViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddedPlaces", for: indexPath) as? SelectedPlacesCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.setup(with: placeListViewModel.selectedPlacesViewModels[indexPath.row])
        return cell
    }
}
