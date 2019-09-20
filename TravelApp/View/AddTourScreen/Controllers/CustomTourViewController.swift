//
//  CustomTourViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/12/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class CustomTourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var customTourTableView: UITableView!
    @IBOutlet weak var selectedPlacesCollectionView: UICollectionView!
    
    var customTourViewModel = PlaceListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTourTableView.dataSource = self
        customTourTableView.delegate = self
        
        customTourViewModel.getPlaces { (places) in
            self.customTourTableView.reloadData()
        }
    }
    
    //MARK: -> TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customTourViewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "attraction", for: indexPath) as? AttractionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(with: customTourViewModel.cellViewModels[indexPath.row])
        return cell
    }
    
    //MARK: -> CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
