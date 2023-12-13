//
//  CollectionViewLayout.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import UIKit
import SwiftUI

extension  HomeViewController{
    
    internal func registerUIComponents(){
        
        let saleBannerNib = UINib(nibName: "SaleBannerCollectionViewCell", bundle: nil)
        homeCollectionView.register(saleBannerNib, forCellWithReuseIdentifier: SaleBannerCollectionViewCell.identifier)
        
        let productNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        homeCollectionView.register(productNib, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        let productHeadderNib = UINib(nibName: "ProductsHeadderCollectionReusableView", bundle: nil)
        homeCollectionView.register(productHeadderNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductsHeadderCollectionReusableView.identifier)
        
        let categoryHeadderNib = UINib(nibName: "CategoriesHeadderCollectionReusableView", bundle: nil)
        homeCollectionView.register(categoryHeadderNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoriesHeadderCollectionReusableView.identifier)
    }
    
    internal func createLayout(_ collectionView:UICollectionView) -> UICollectionViewCompositionalLayout {
        
        let layout =  UICollectionViewCompositionalLayout {[weak self] (sectionIndex, layoutEnvironment)-> NSCollectionLayoutSection? in
            
            guard let self = self  else {fatalError("view controller refrance is not avalable")}
            
            switch self.sections[sectionIndex]{
                
            case .banners:
                
                return bannerLayout()
                
            case .products:
                
                return productLayout(collectionView)
                
            
            }
        }
        
        return layout
    }
 
    private func bannerLayout()-> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.25)), subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(top: 0, leading: 10, bottom: 5, trailing: 10)
        section.interGroupSpacing = 10
        
        return section
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
        section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    internal func configureNavBar(){
        let cart = getCartButtonInstance()
        
        cart.cartButton.addTarget(self, action: #selector(cartTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: cart)
        
        var containerWidth = cart.cartButton.imageView?.image?.size.width ?? 0
        containerWidth += cart.cartItemsNumber.frame.width
        
        var containerHeight = cart.cartButton.imageView?.image?.size.height ?? 0
        containerHeight += cart.cartItemsNumber.frame.height
        
        barButton.customView?.widthAnchor.constraint(equalToConstant: containerWidth).isActive = true
        barButton.customView?.heightAnchor.constraint(equalToConstant: containerHeight).isActive = true
        
        self.navigationItem.rightBarButtonItem = barButton
    }
}
