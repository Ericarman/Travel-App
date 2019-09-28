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
    @IBOutlet weak var placeNameLabel: UILabel!
    
    weak var delegate: AttractionTableViewCellDelegate?
    var placeViewModel: PlaceViewModel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
    
    func setup(with viewModel: PlaceViewModel) {
        self.placeViewModel = viewModel
        
        placeNameLabel.text = viewModel.placeName
        placeViewModel?.getImage(completion: { (image) in
            DispatchQueue.main.async {
                self.mainImageView.image = image
            }
        })
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let place = placeViewModel else { return }
        delegate?.addButtonTapped(place: place)
    }
}
