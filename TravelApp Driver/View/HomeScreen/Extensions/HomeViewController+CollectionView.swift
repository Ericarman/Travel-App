//
//  HomeViewController+CollectionView.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/24/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        cell.cardNameLabel.text = "Card \(indexPath.row)"
        cell.setup()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfView = self.collectionView.frame.size.width
        let cellWidth = widthOfView / 2 - 15
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}
