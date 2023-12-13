//
//  CollcectionViewDataSource.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import UIKit

extension HomeViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .banners:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleBannerCollectionViewCell.identifier, for: indexPath) as! SaleBannerCollectionViewCell
            cell.configure(using:banners[indexPath.row])
            
            return cell
            
        case .products:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
            let product = products[indexPath.row]
            let inCart = productInCart(product: product)
            
            cell.configure(using:product, inCart: inCart)
            cell.delegate = self
            return cell
           
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           
           var reusableview = UICollectionReusableView()
        if (kind == UICollectionView.elementKindSectionHeader) {
               switch (sections[indexPath.section]) {
               case .products:
                   let  header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductsHeadderCollectionReusableView.identifier, for: indexPath) as! ProductsHeadderCollectionReusableView
                   reusableview = header
               case .banners:
                   break
                   
               }
           }
           return reusableview
       }
}
