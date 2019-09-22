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
    @IBOutlet weak var tourImageView: UIImageView!
    
    weak var viewModel: TourViewModel!
    
    func setup(with viewModel: TourViewModel) {
        self.viewModel = viewModel
        tourNameLabel.text = viewModel.tourName

        viewModel.tourPlaces.forEach { (place) in
            
            place.getImage(completion: { (image) in
                DispatchQueue.main.async {
                    self.tourImageView.image = image
                }
            })
        
        }

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
