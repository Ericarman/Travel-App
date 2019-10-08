//
//  OrderTourViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 10/5/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class OrderTourViewController: UIViewController {

    @IBOutlet weak var stepperLabel: UILabel!
    
    var tripViewModel = TripViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperLabel.text = String(Int(sender.value))
    }
}
