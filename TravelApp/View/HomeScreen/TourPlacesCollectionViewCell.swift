//
//  tourPlacesCollectionViewCell.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/22/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class TourPlacesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tourImageView: UIImageView!
    
    func setup(viewModel: PlaceViewModel) {
        viewModel.getImage(completion: { (image) in
            DispatchQueue.main.async {
                self.tourImageView.image = image
            }
        })
    }
    
}
