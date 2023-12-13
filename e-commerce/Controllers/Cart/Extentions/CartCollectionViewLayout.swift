//
//  CartCollectionViewLayout.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 07/12/2023.
//

import UIKit
import SwiftUI

extension  CartViewController{
    
    internal  func registerUIComponents(){
        let CartItemNib = UINib(nibName: "CartItemCollectionViewCell", bundle: nil)
        cartItemsCollectionView.register(CartItemNib, forCellWithReuseIdentifier: CartItemCollectionViewCell.identifier)
    }
    
    internal func createLayout(_ collectionView:UICollectionView) -> UICollectionViewCompositionalLayout {
        
        let layout =  UICollectionViewCompositionalLayout {[weak self] (sectionIndex, layoutEnvironment)-> NSCollectionLayoutSection? in
            
            guard let self = self  else {fatalError("view controller refrance is not avalable")}
            
            return cartItemLayout()
            
        }
        
        return layout
    }
 
    private func cartItemLayout()-> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25)), subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 5, trailing: 10)
        section.interGroupSpacing = 10
        
        return section
    }
    
    
    
    internal func configureNavBar(){
    }
}
