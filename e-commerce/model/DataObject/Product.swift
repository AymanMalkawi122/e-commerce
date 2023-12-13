//
//  Product.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 26/11/2023.
//

import Foundation

struct Product: Codable, ProductBase {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    
    
}

struct Rating: Codable {
    let rate: Double
    let count: Int
    
    init(rate: Double, count: Int) {
        self.rate = rate
        self.count = count
    }
}

protocol ProductBase{
    var id: Int { get set }
    var title: String { get set }
    var price: Double { get set }
    var description: String { get set }
    var category: String { get set }
    var image: String { get set }
    var rating: Rating { get set }
}
