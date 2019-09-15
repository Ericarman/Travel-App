//
//  HomeViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/7/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
    let toursViewModel = TourListViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toursViewModel.getTours { (tours) in
            self.collectionView.reloadData()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toursViewModel.tours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toursCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.setup(with: toursViewModel.tours[indexPath.row])
        
        return cell
    }
    
}
