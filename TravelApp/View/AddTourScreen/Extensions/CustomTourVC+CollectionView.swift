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
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddedPlaces", for: indexPath) as? UICollectionViewCell else {
            
            return UICollectionViewCell()
        }
        return cell
    }
}
