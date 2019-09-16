//
//  FavoritesCollectionViewController.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/13/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    let toursViewModel = TourListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.favoritesCollectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toursViewModel.tours.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "toursCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
    
        cell.delegate = self
        cell.setup(with: self.toursViewModel.tours[indexPath.row])
    
        return cell
    }

}
