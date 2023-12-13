//
//  CartTableViewDataSource.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import UIKit

extension CartViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartItemCollectionViewCell.identifier, for: indexPath) as! CartItemCollectionViewCell
        let currentCartItem = cartItems[indexPath.row]
        
        cell.delegate = self
        cell.configure(using: currentCartItem)
        return cell
    }
    
    
}
