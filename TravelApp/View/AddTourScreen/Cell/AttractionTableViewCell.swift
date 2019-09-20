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
    
    weak var delegate: AttractionTableViewCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView = nil
        descriptionLabel = nil
        delegate = nil
    }
    
    func setup(with viewModel: PlaceViewModel) {
        mainImageView.image = viewModel.mainImage
        descriptionLabel.text = viewModel.description
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        delegate?.buttonTapped(cell: self)
    }
    
}
