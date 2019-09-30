//
//  TripViewModel.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/30/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation

struct TripViewModel {
    private let tourID: String
    private let wifi: Bool
    private let AC: Bool
    
    init(tourID: String, WiFi: Bool, AC: Bool) {
        self.tourID = tourID
        self.wifi = WiFi
        self.AC = AC
    }
    
    func sendOrder(completion: @escaping (_ error: Error?) -> Void) {
        TripUploader.shared.setTrip(tourID: tourID, WiFi: wifi, AC: AC) { (error) in
            completion(error)
        }
    }
}
