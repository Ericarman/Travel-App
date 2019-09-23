//
//  SignInViewController+CollectionViewController.swift
//  TravelApp Driver
//
//  Created by Gerasim Israyelyan on 9/23/19.
//  Copyright © 2019 Eric Hovhannisyan. All rights reserved.
//

import UIKit

extension SignUpViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = self.cellIdentyfiers[indexPath.row]
        switch indexPath.row {
        case 0:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? SignUpFirstCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? SignUpSecondCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case 2:
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? SignUpThirdCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.collectionView.frame.size
    }
    
}
