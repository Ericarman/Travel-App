//
//  CustomTourViewController.swift
//  TravelApp
//
//  Created by Eric Hovhannisyan on 9/12/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class CustomTourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var customTourTableView: UITableView!
    
    var customTourViewModel = CustomTourViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTourTableView.dataSource = self
        customTourTableView.delegate = self
    }
    
    //MARK: -> TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: (Eric)
        return customTourViewModel
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "attraction", for: indexPath) as? AttractionTableViewCell else {
            return UITableViewCell()
        }
        //TODO: (Eric)
        return cell
    }
}
