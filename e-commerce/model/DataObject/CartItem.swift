//
//  CartItem.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import Foundation
import FirebaseDatabaseInternal

struct CartItem:ProductBase{
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    var count = 1
    var isSelected = false
    
    init(product:Product){
        id = product.id
        title = product.title
        price = product.price
        description = product.description
        category = product.category
        image = product.image
        rating = product.rating
    }
    
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshotValue["id"] as! Int
        title = snapshotValue["title"] as! String
        price = snapshotValue["price"] as! Double
        description = snapshotValue["description"] as! String
        category = snapshotValue["category"] as! String
        image = snapshotValue["image"] as! String
        
        let rate: Double = snapshotValue["rating_rate"] as! Double
        let rateCount: Int = snapshotValue["rating_count"] as! Int
        
        rating = .init(rate: rate, count: rateCount)
        count = snapshotValue["count"] as! Int
    }
    
    func toAnyObject() -> Any {
        return [
            "id" : id,
            "title" : title,
            "price" : price,
            "description" : description,
            "category" : category,
            "image" : image,
            "rating_rate" : rating.rate,
            "rating_count" : rating.count,
            "count": count
        ]
    }
}
