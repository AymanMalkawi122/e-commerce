//
//  HomeCollectionView.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 28/11/2023.
//

import Foundation

enum HomeSection{
    case products([Product])
    case banners([String])
    
    var count: Int {
        switch self{
            
        case .products(let items):
            return items.count
        case .banners(let items):
            return items.count
        }
    }
}
