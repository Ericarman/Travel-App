//
//  HomeCollectionViewCell.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/24/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    func setup() {
        setupContentView()
    }
    
    private func setupContentView() {
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
    }
    
}
