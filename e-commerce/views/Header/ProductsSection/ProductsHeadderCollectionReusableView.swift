//
//  ProductsHeadderCollectionReusableView.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 30/11/2023.
//

import UIKit

class ProductsHeadderCollectionReusableView: UICollectionReusableView {

    static let identifier = "Product Headder"
    
    @IBOutlet weak var productsFilter: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
