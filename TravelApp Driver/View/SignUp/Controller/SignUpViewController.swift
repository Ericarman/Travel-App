//
//  SignUpViewController.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentyfiers: [String] = ["signUpFirst", "signUpSecond", "signUpThird"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "SignUpFirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "signUpFirst")
        collectionView.register(UINib(nibName: "SignUpSecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "signUpSecond")
        collectionView.register(UINib(nibName: "SignUpThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "signUpThird")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
