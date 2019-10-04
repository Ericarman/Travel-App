//
//  DescriptionViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/28/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: PlaceViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = viewModel {
            setup(with: viewModel)
        }
    }
    
    private func setup(with viewModel: PlaceViewModel) {
        nameLabel.text = viewModel.placeName
        
        viewModel.getImage { (image) in
            DispatchQueue.main.async {
                self.mainImageView.image = image
            }
        }
    }
}
