//
//  SignUpSecondCollectionViewCell.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class SignUpSecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var driverImageView: UIImageView!
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var markOfCarField: UITextField!
    @IBOutlet weak var ModelField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var numberPlateField: UITextField!
    @IBOutlet weak var colorField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
