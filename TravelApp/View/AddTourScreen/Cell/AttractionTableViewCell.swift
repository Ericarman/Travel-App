//
//  AttractionTableViewCell.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(with viewModel: AttractionViewModel) {
        mainImageView.image = viewModel.mainImage
        descriptionLabel.text = viewModel.description
    }
}
