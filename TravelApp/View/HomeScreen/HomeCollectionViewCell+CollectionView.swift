//
//  HomeCollectionViewCell+CollectionView.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/24/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

extension HomeCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tourPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "placeImageCell", for: indexPath) as? TourPlacesCollectionViewCell else {
            return UICollectionViewCell()
        }
        let placeViewModel = self.viewModel.tourPlaces[indexPath.row]
        cell.setup(viewModel: placeViewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.frame.size
    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//                self.pageControll.currentPage = indexPath.row
//
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageControll.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
