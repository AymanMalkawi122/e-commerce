//
//  CartButton.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 12/12/2023.
//

import UIKit

class CartButton: UIView {
    @IBOutlet weak var cartItemsNumber: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    
    
}

func getCartButtonInstance() -> CartButton{
    let nibName = "CartButton"
    let xib = UINib(nibName: nibName, bundle: nil)
    let rawView = xib.instantiate(withOwner: nil, options: nil).first
    
    if let view = rawView as? CartButton{
        let cartImage = UIImage(resource: .cart).withRenderingMode(.alwaysTemplate)
        view.cartButton.setImage(cartImage, for: .normal)
        view.cartButton.imageView?.tintColor = .primary
        view.cartItemsNumber.clipsToBounds = true
        view.cartItemsNumber.layer.cornerRadius = 8
        return view
    }
    else {
        fatalError()
    }
}
