//
//  ProductCollectionViewCell.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 11/12/2023.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Product Cell"
    var delegate: ProductCellDelegate? = nil
    var product: Product? = nil
    var inCart = false
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var cartButton: PrimaryButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(using product:Product, inCart: Bool){
        self.product = product
        self.inCart = inCart
        productPrice.text = "$" + String(product.price)
        productName.text = product.title
        setupStyle()
        loadImage(url: product.image)
    }
    
    private func loadImage(url:String){
        if let imageURL = URL(string: url){
            productImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            productImage.sd_imageIndicator?.startAnimatingIndicator()
            productImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "empty-image"), options: .continueInBackground, completed: nil)
            productImage.contentMode = .scaleAspectFit
        } else {
            print("Invalid URL")
            productImage.image = UIImage(named: "empty-image")
        }
    }
    
    private func setupStyle(){
        self.clipsToBounds = true
        self.backgroundColor = .productBackground
        self.layer.cornerRadius = 5
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        
        productPrice.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        productName.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        setupButtonStyle()
        
    }
    
    private func setupButtonStyle(){
        
        
        switch inCart{
            
        case false:
            cartButton.setTitle("Add to cart", for: .normal)
            cartButton.setupDefaultStyle()
            
        case true:
            cartButton.setTitle("Remove from cart", for: .normal)
            cartButton.setupSelectedStyle()
            
        }
    }
    
    @IBAction func cartButtonClick(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        
        guard let product = product else{
            return
        }
        
        switch inCart{
        case false:
            delegate.addToCart(product: product)
            
        case true:
            delegate.removeFromCart(id: product.id)
            
        }
    }
}

protocol ProductCellDelegate{
    func addToCart(product: Product)
    func removeFromCart(id: Int)
}
