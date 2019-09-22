//
//  SelectedPlacesCollectionViewCell.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/20/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class SelectedPlacesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    func setup(with viewModel: PlaceViewModel) {
        viewModel.getImage { (image) in
            DispatchQueue.main.async {
                self.placeImageView.image = image
            }
        }
    }
}
