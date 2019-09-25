//
//  OrderTableViewCell.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var orderName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    @IBAction func acceptButtonTapped(_ sender: Any) {
    }
    
}
