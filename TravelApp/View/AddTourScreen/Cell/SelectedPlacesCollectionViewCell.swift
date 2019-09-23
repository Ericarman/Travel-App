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
    
    weak var delegate: SelectedPlacesCollectionViewCellDelegate?
    var placeViewModel: PlaceViewModel?
    
    override func prepareForReuse() {
        delegate = nil
    }
    
    func setup(with viewModel: PlaceViewModel) {
        placeImageView.image = viewModel.mainImage
        placeViewModel = viewModel
    }
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        guard let place = placeViewModel else { return }
        delegate?.removeTapped(place: place)
    }
}
