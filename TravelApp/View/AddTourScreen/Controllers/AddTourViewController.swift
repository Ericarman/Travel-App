//
//  AddTourViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/12/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class AddTourViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var customTourCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTourCollectionView.delegate = self
        customTourCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attraction", for: indexPath) as? AttractionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
