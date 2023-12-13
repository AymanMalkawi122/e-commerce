//
//  Cache.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

protocol CacheLayer{
    
    func getProducts(handler: @escaping (_ products:[Product]) -> (Void))
    
    func getProductByID(ID productID:Int, handler: @escaping (_ product:Product) -> (Void))
    
    func cacheIsValid()-> Bool
}
