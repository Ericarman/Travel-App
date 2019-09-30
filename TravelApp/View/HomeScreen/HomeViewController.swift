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
    var delegate: HomeViewControllerDelegate!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        
        toursViewModel.getTours { (tours) in
            self.collectionView.reloadData()
        }
        
        let favoriteVC = self.tabBarController?.viewControllers![1] as! FavoritesViewController
        self.delegate = favoriteVC
        
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
