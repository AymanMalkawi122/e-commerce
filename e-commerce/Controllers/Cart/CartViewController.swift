//
//  CartViewController.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import UIKit

class CartViewController: UIViewController {
    var repository: Repository!
    var cartItems = [CartItem]()
    
    @IBOutlet weak var cartItemsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = AppConfiguration.repositoryInstance
        repository.registerListener(self)
        registerUIComponents()
        cartItemsCollectionView.dataSource = self
        cartItems = repository.getCartItems()
        cartItemsCollectionView.reloadData()
        cartItemsCollectionView.collectionViewLayout = createLayout(cartItemsCollectionView)
    }
    
}

extension CartViewController: CartItemListObserver{
    func notify(list: [CartItem]) {
        cartItems = list
        cartItemsCollectionView.reloadData()
    }
}
