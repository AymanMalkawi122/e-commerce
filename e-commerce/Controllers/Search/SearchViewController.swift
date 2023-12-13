//
//  SearchViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import UIKit

class SearchViewController: UIViewController{
    var filteredProducts = [Product]()
    var products = [Product]()
    var cartItems = [CartItem]()
    var repository: Repository!
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = AppConfiguration.repositoryInstance
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        cartItems = repository.getCartItems()
        
        repository.registerListener(self)
        
        registerUIComponents()
        
        repository.getProducts{ products in
            self.products = products
            self.filteredProducts = products
            DispatchQueue.main.async {
                self.searchCollectionView.reloadData()
            }
        }
        searchCollectionView.collectionViewLayout = createLayout(searchCollectionView)
        configureNavBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let targetVC = segue.destination as? ProductDetailViewController else { return }
        targetVC.product = (sender as! Product)
        targetVC.inCart = productInCart(product: sender as! Product)
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

extension SearchViewController: CartItemListObserver{
    func notify(list: [CartItem]) {
        cartItems = list
        searchCollectionView.reloadData()
        
        let cartButton = self.navigationItem.rightBarButtonItem?.customView as! CartButton
        cartButton.cartItemsNumber.text = "\(list.count)"
    }
}
