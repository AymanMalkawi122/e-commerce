//
//  NavigationBarDelegate.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import UIKit

extension SearchViewController : UISearchBarDelegate{
    @objc internal func cartTapped(){
        performSegue(withIdentifier: Constatnts.Identifier.Segue.SEARCH_TO_CART, sender: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredProducts = products.filter{(product)->Bool in
            let range = product.title.range(of: searchText, options: .caseInsensitive)
            return range != nil
        }
        
        if searchText.isEmpty{
            filteredProducts = products
        }
        
        self.searchCollectionView.reloadData()
    }
}

extension SearchViewController: ProductCellDelegate{
    func removeFromCart(id: Int) {
        repository.deleteCartItem(id: id)
    }
    
    func addToCart(product: Product) {
        let cartItem = CartItem(product: product)
        repository.addCartItem(item: cartItem)
    }
}
