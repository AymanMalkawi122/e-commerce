//
//  CollectionViewDelegate.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import UIKit

extension HomeViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section]{
            
        case .products(_):
            let product = products[indexPath.row]
            performSegue(withIdentifier: Constatnts.Identifier.Segue.HOME_TO_PRODUCT_DETAIL, sender: product)
        case .banners(_):
            break
        }
    }
}


