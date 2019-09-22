//
//  HomeCollectionViewCell.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    var delegate: HomeCollectionViewCellDelegate!
    var isFavorite: Bool!
    
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var favoriteButtonView: UIView!
    @IBOutlet weak var favoriteButtonImageView: UIImageView!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    weak var viewModel: TourViewModel!
    
    func setup(with viewModel: TourViewModel) {
        self.viewModel = viewModel
        tourNameLabel.text = viewModel.tourName
        imagesCollectionView.dataSource = self
        togglefavoriteImage()
        favoriteButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(favoriteButtonTapped)))
    }
    
    @objc func favoriteButtonTapped() {
        delegate.tour(with: self)
    }
    
    func togglefavoriteImage() {
        self.favoriteButtonImageView.image = viewModel.isFavorite ? UIImage(named: "star-2") : UIImage(named: "star-1")
    }
}

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
    
    
}
