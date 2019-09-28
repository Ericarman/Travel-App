//
//  TourOverviewViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/28/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class TourOverviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tourOverviewTableView: UITableView!
    
    var placeListViewModel = PlaceListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tourOverviewTableView.dataSource = self
        tourOverviewTableView.delegate = self
        
        //tourOverviewTableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeListViewModel.selectedPlacesViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceOverviewCell") as? PlaceOverviewTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: placeListViewModel.selectedPlacesViewModels[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let descriptionVC = storyboard?.instantiateViewController(identifier: "DescriptionVC") as? DescriptionViewController else { return }
        
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
}
