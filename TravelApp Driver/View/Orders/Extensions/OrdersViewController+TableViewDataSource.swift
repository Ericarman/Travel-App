//
//  OrdersViewController+TableViewDataSource.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

extension OrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
