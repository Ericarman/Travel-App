//
//  ImageDownloader.swift
//  TravelApp
//
//  Created by Gerasim Israyelyan on 9/18/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class ImageDownloader {
    static var shared: ImageDownloader = ImageDownloader()
    
    let storage = Storage.storage()
    
    func getImage(from url: String, completion: @escaping (_ data: Data?) -> Void) {
        storage.reference(forURL: url).getData(maxSize: 3 * 1024 * 1024) { (data, error) in
            if error != nil {
                print("error: \(error!.localizedDescription)")
                completion(nil)
            } else if let data = data {
                completion(data)
            }
        }
    }
}
