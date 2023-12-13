//
//  ProductDetailViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 03/12/2023.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController {
    
    var product: Product!
    var inCart: Bool = false
    var repository: Repository!

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var cartButton: PrimaryButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository  = AppConfiguration.repositoryInstance
        repository.getProductByID(ID: product.id){ apiData in
            self.product = apiData
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    private func updateUI(){
        productName.text = product.title
        productPrice.text = "$ \(product.price)"
        productDescription.text = product.description
        setupButtonStyle()
        
        if let imageURL = URL(string: product.image){
            productImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            productImage.sd_imageIndicator?.startAnimatingIndicator()
            productImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "empty-image"), options: .continueInBackground, completed: nil)
            productImage.contentMode = .scaleAspectFit
            } else {
                print("Invalid URL")
                productImage.image = UIImage(named: "empty-image")
            }
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
    
    @IBAction func addToCartClicked(_ sender: Any) {
        
        switch inCart{
        case false:
            let item = CartItem(product: product)
            repository.addCartItem(item: item)
            inCart = true
            setupButtonStyle()
            
        case true:
            repository.deleteCartItem(id: product.id)
            inCart = false
            setupButtonStyle()
        }
    }
}


