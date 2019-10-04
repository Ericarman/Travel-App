//
//  PlaceOverviewTableViewCell.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/28/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class PlaceOverviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    func setup(with viewModel: PlaceViewModel) {
        nameLabel.text = viewModel.placeName
        
        viewModel.getImage { (image) in
            DispatchQueue.main.async {
                self.mainImageView.image = image
            }
        }
        
        //descriptionLabel.text = viewModel.description --add later--
    }
}
