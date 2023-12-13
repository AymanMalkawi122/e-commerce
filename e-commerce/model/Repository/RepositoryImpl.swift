//
//  RepositoryImpl.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class RepositoryImpl: Repository{
    
    internal var database: DataBase
    internal var apiManager: APIManager
    internal var cacheLayer: CacheLayer
    
    
    required init(apiManager: APIManager, cacheLayer: CacheLayer, database: DataBase) {
        self.apiManager = apiManager
        self.cacheLayer = cacheLayer
        self.database = database
    }
    
    func addCartItem(item: CartItem) {
        database.addCartItem(item: item)
    }
    
    func getCartItems() -> [CartItem] {
        database.getCartItems()
    }
    
    func deleteCartItem(item: CartItem) {
        database.deleteCartItem(item: item)
    }
    
    func deleteCartItem(id: Int) {
        database.deleteCartItem(id: id)
    }
    
    func getProducts(handler: @escaping ([Product]) -> (Void)) {
        print("\(#function)")
        if cacheLayer.cacheIsValid() == true{
            print("SOURCE: Cache Layer")
            cacheLayer.getProducts(handler: handler)
        }
        else{
            print("SOURCE: APIManager")
            apiManager.getProducts(handler: handler)
        }
    }
    
    func getProductByID(ID productID: Int, handler: @escaping (Product) -> (Void)) {
            print("\(#function)")
        if cacheLayer.cacheIsValid() == true{
            print("SOURCE: Cache Layer")
            cacheLayer.getProductByID(ID: productID, handler: handler)
        }
        else{
            print("SOURCE: APIManager")
            apiManager.getProductByID(ID: productID, handler: handler)
        }
    }
    
    
    func registerListener(_ listner: CartItemListObserver) {
        database.registerListener(listner)
    }
    
}
