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

        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        guard let addTourViewController = storyboard?.instantiateViewController(withIdentifier: "AddTourNavigationController"), tabBarController!.selectedIndex != 2 else { return }
//
//        self.present(addTourViewController, animated: true)
    }
}
