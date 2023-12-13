//
//  FireBase.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 06/12/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class FireBase: DataBase{
    
    private let database = Database.database().reference()
    private var cartItemsList = [CartItem]()
    private var cartItemObservers = [CartItemListObserver]()
    
    init(){
        guard let userID = Auth.auth().currentUser?.uid else{fatalError("Unauthorized database access")}
        
        database.child(Constatnts.Key.FIREBASE_CART_ITEM_CHILD_KEY).child(userID).observe(.value, with: {
            [weak self] (snapshot) in
            guard let self = self else {
                return
            }
            var temp = [CartItem]()
            
            for child in snapshot.children{
                temp.append(CartItem(snapshot: child as! DataSnapshot))            }
            
            
            self.cartItemsList = temp
            for observer in cartItemObservers{
                observer.notify(list: self.cartItemsList)
            }
        })
    }
    
    
    func deleteCartItem(item: CartItem) {
        let key = "\(Constatnts.Key.FIREBASE_CART_ITEM_CHILD_KEY)"
        guard let userID = Auth.auth().currentUser?.uid else{fatalError("Unauthorized database access")}
        
        database.child(key).child(userID).child("\(item.id)").setValue(nil)
        
    }
    
    func deleteCartItem(id: Int) {
        let key = "\(Constatnts.Key.FIREBASE_CART_ITEM_CHILD_KEY)"
        guard let userID = Auth.auth().currentUser?.uid else{fatalError("Unauthorized database access")}
        
        database.child(key).child(userID).child("\(id)").setValue(nil)
        
    }
    
    func addCartItem(item: CartItem) {
        let key = "\(Constatnts.Key.FIREBASE_CART_ITEM_CHILD_KEY)"
        guard let userID = Auth.auth().currentUser?.uid else{fatalError("Unauthorized database access")}
        
        database.child(key).child(userID).child("\(item.id)").setValue(item.toAnyObject())
    }
    
    func getCartItems() -> [CartItem] {
        return cartItemsList
    }
    
    func registerListener(_ listner: CartItemListObserver) {
        cartItemObservers.append(listner)
    }
}

protocol CartItemListObserver{
    func notify(list: [CartItem])
}
