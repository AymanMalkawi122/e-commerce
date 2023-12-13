//
//  HomeViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 26/11/2023.
//

import UIKit
import SwiftUI
import FirebaseAuth

class HomeViewController: UIViewController {
    static let idenfifier = "Home"
    var products = [Product]()
    var cartItems = [CartItem]()
    var banners = ["banner1","banner2","banner3"]
    var sections = [HomeSection]()
    var repository: Repository!
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = AppConfiguration.repositoryInstance
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        cartItems = repository.getCartItems()
        repository.registerListener(self)
        registerUIComponents()
        
        fetchProducts()
        homeCollectionView.collectionViewLayout = createLayout(homeCollectionView)
        configureNavBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let targetVC = segue.destination as? ProductDetailViewController else { return }
        targetVC.product = (sender as! Product)
        targetVC.inCart = productInCart(product: sender as! Product)
    }
    
    private func fetchProducts(){
        repository.getProducts{ products in
            self.products = products
            self.sections.append(HomeSection.banners(self.banners))
            self.sections.append(HomeSection.products(self.products))
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        }
    }
    
    internal func productInCart(product: Product)-> Bool{
        var inCart = false
        
        for item in cartItems{
            if item.id == product.id{
                inCart = true
            }
        }
        return inCart
    }
    
}


extension HomeViewController: CartItemListObserver{
    func notify(list: [CartItem]) {
        cartItems = list
        homeCollectionView.reloadData()
        let cartButton = self.navigationItem.rightBarButtonItem?.customView as! CartButton
        cartButton.cartItemsNumber.text = "\(list.count)"
    }
}
