//
//  HomeCollectionViewCell.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/11/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var favoriteButtonView: UIView!
    
    func setup(with viewModel: TourViewModel) {
        tourNameLabel.text = viewModel.tourName
        
        favoriteButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(favoriteButtonTapped)))
    }
    
    @objc func favoriteButtonTapped() {
        
    }
}
