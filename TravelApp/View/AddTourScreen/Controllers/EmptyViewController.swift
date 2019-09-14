//
//  EmptyViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/14/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let addTourViewController = storyboard?.instantiateViewController(withIdentifier: "AddTourNavigationController") else { return }
        
        self.present(addTourViewController, animated: true)
    }
}
