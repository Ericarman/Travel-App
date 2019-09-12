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
    
    func setup(name: String) {
        tourNameLabel.text = name
    }
}
