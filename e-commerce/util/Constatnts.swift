//
//  Constatnts.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 27/11/2023.
//

import Foundation

struct Constatnts{
    struct Identifier{
        struct ViewController{
            static let PRIVATE_SECTION = "Private Section"
            static let PUBLIC_SECTION = "Public Section"
        }
        
        struct Segue{
            static let HOME_TO_PRODUCT_DETAIL = "HomeToProductDetail"
            static let HOME_TO_CART = "HomeToCart"
            static let SEARCH_TO_PRODUCT_DETAIL = "SearchToProductDetail"
            static let SEARCH_TO_CART = "SearchToCart"
            static let LOGIN_TO_SIGNUP = "LoginToSignup"
        }
    }
    struct Urls {
        static let ALL_PRODUCTS = "https://fakestoreapi.com/products"
       
        static func PRODUCT_BY_ID(_ productID:Int) -> String{
            return "https://fakestoreapi.com/products/\(productID)"
        }
    }
    
    struct Key{
        static let FIREBASE_CART_ITEM_CHILD_KEY = "Cart Item"
        static let DARK_MODE = "Dark Mode"
    }
}
