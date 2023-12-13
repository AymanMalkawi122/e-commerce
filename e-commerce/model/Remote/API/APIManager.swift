//
//  APIManager.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 03/12/2023.
//

import Foundation

protocol APIManager{
    
    func getProducts( handler: @escaping (_ products:[Product])->(Void) )
    
    func getProductByID(ID productID:Int, handler: @escaping (_ product:Product) -> (Void))
    
}
