//
//  CustomTourViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/12/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class CustomTourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AttractionTableViewCellDelegate {
    
    @IBOutlet weak var customTourTableView: UITableView!
    @IBOutlet weak var selectedPlacesCollectionView: UICollectionView!
    
    var placeListViewModel = PlaceListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTourTableView.dataSource = self
        customTourTableView.delegate = self
        customTourTableView.allowsSelection = false
        
        selectedPlacesCollectionView.dataSource = self
        selectedPlacesCollectionView.delegate = self
        
        placeListViewModel.getPlaces { (places) in
            self.customTourTableView.reloadData()
        }
    }
    
    //MARK: -> TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeListViewModel.placesViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "attraction", for: indexPath) as? AttractionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.setup(with: placeListViewModel.placesViewModels[indexPath.row])
        return cell
    }
    
    //MARK: -> Actions
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
        guard let tourOverviewVC = storyboard?.instantiateViewController(identifier: "TourOverviewVC") as? TourOverviewViewController else { return }
        
        tourOverviewVC.placeListViewModel = placeListViewModel
        
        navigationController?.pushViewController(tourOverviewVC, animated: true)
    }
    
    //MARK: -> AttractionTableViewCellDelegate
    
    func addButtonTapped(place: PlaceViewModel) {
        if placeListViewModel.addPlaceToCollectionView(place: place) {
            selectedPlacesCollectionView.reloadData()
        }
    }
}
