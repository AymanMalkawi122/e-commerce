//
//  DataBase.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 06/12/2023.
//

import Foundation

protocol DataBase{
    func addCartItem(item: CartItem)
    
    func getCartItems()-> [CartItem]
    
    func deleteCartItem(item: CartItem)
    
    func deleteCartItem(id: Int)
    
    func registerListener(_ listner: CartItemListObserver)
}
