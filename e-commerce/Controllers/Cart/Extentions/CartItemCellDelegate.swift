//
//  CartTableViewDelegate.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import UIKit

extension CartViewController: CartItemDelegate{
    
    func deleteCartItem(item: CartItem) {
        repository.deleteCartItem(item: item)
    }
    
    func incrementCount(item: CartItem) {
        var item = item
        item.count += 1
        
        repository.addCartItem(item: item)
    }
    
    func decrementCount(item: CartItem) {
        var item = item
        item.count -= 1
        
        repository.addCartItem(item: item)
    }
    
    
}
