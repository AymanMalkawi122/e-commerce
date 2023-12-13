//
//  CollectionViewDelegate.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import UIKit

extension SearchViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let product = filteredProducts[indexPath.row]
            performSegue(withIdentifier: Constatnts.Identifier.Segue.SEARCH_TO_PRODUCT_DETAIL, sender: product)
    }
}
