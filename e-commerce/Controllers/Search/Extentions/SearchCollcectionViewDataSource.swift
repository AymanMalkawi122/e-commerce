//
//  CollcectionViewDataSource.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import UIKit

extension SearchViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = (filteredProducts.isEmpty) ? 0 : 1
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        let product = filteredProducts[indexPath.row]
        let inCart = productInCart(product: product)
        
        cell.configure(using:product, inCart: inCart)
        cell.delegate = self
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview = UICollectionReusableView()
        if (kind == UICollectionView.elementKindSectionHeader) {
            
            let  header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductsHeadderCollectionReusableView.identifier, for: indexPath) as! ProductsHeadderCollectionReusableView
            reusableview = header
            
        }
        return reusableview
    }
}
