//
//  NavigationBarDelegate.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import UIKit

extension HomeViewController{
    @objc internal func cartTapped(){
        performSegue(withIdentifier: Constatnts.Identifier.Segue.HOME_TO_CART, sender: nil)
    }
}

extension HomeViewController: ProductCellDelegate{
    func removeFromCart(id: Int) {
        repository.deleteCartItem(id: id)
    }
    
    func addToCart(product: Product) {
        let cartItem = CartItem(product: product)
        repository.addCartItem(item: cartItem)
    }
}
