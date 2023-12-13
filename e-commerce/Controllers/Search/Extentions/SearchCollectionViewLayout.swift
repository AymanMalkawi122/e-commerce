//
//  CollectionViewLayout.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import UIKit
import SwiftUI

extension  SearchViewController{
    
    internal func registerUIComponents(){
        
        
        let productNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        searchCollectionView.register(productNib, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        let productHeadderNib = UINib(nibName: "ProductsHeadderCollectionReusableView", bundle: nil)
        searchCollectionView.register(productHeadderNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductsHeadderCollectionReusableView.identifier)
    }
    
    internal func createLayout(_ collectionView:UICollectionView) -> UICollectionViewCompositionalLayout {
        
        let layout =  UICollectionViewCompositionalLayout {[weak self] (sectionIndex, layoutEnvironment)-> NSCollectionLayoutSection? in
            
            guard let self = self  else {fatalError("view controller refrance is not avalable")}
            
                return productLayout(collectionView)
        }
        
        return layout
    }
    
    private func productLayout(_ collectionView:UICollectionView)-> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)
            ),
            subitems: [item]
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(collectionView.frame.width), heightDimension: .absolute(100)),
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    
    internal func configureNavBar(){
        let cart = getCartButtonInstance()
        cart.cartItemsNumber.text = "\(cartItems.count)"
        cart.cartButton.addTarget(self, action: #selector(cartTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: cart)
        
        var containerWidth = cart.cartButton.imageView?.image?.size.width ?? 0
        containerWidth += cart.cartItemsNumber.frame.width
        
        var containerHeight = cart.cartButton.imageView?.image?.size.height ?? 0
        containerHeight += cart.cartItemsNumber.frame.height
        
        barButton.customView?.widthAnchor.constraint(equalToConstant: containerWidth).isActive = true
        barButton.customView?.heightAnchor.constraint(equalToConstant: containerHeight).isActive = true
        
        self.navigationItem.rightBarButtonItem = barButton
        createSearchBar()
    }
    
    private func createSearchBar(){
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search . . ."
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.becomeFirstResponder()
        
        self.navigationItem.titleView = searchBar
    }
}
