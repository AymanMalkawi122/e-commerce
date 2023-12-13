import UIKit
import SDWebImage

class CartItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Cart Item Cell"
    var delegate: CartItemDelegate? = nil
    var cartItem: CartItem? = nil
    
    
    
    
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var cartItemCount: UILabel!
    @IBOutlet weak var cartItemName: UILabel!
    @IBOutlet weak var cartItemImage: UIImageView!
    @IBOutlet weak var cartItemPrice: UILabel!
    
    @IBAction func deleteCartItem(_ sender: Any) {
        guard let item = cartItem else{
            return
        }
        
        guard let delegate = delegate else{
            return
        }
        delegate.deleteCartItem(item: item)
    }
    
    @IBAction func decrementCount(_ sender: Any) {
        guard let item = cartItem else{
            return
        }
        guard item.count > 1 else {
            return
        }
        guard let delegate = delegate else{
            return
        }
        delegate.decrementCount(item: item)
    }
    
    @IBAction func incrementCount(_ sender: Any) {
        guard let item = cartItem else{
            return
        }
        
        guard let delegate = delegate else{
            return
        }
        delegate.incrementCount(item: item)
    }
    
    
    @IBAction func checkBoxClicked(_ sender: Any) {
        checkBox.isSelected = !checkBox.isSelected
        
        setupCheckBoxStyle()
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   
    func configure(using cartItem:CartItem){
        self.cartItem = cartItem
        
        checkBox.setImage(UIImage(systemName: "checkmark"), for: .selected)
        checkBox.setImage(nil, for: .normal)
        
        loadImage(url: cartItem.image)
        
        cartItemPrice.text = "$" + String(cartItem.price)
        cartItemName.text = cartItem.title
        cartItemCount.text = "\(cartItem.count)"
        
        setupStyle()
    }

    private func loadImage(url:String){
        if let imageURL = URL(string: url){
            cartItemImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cartItemImage.sd_imageIndicator?.startAnimatingIndicator()
            cartItemImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "empty-image"), options: .continueInBackground, completed: nil)
            cartItemImage.contentMode = .scaleAspectFit
        } else {
            print("Invalid URL")
            cartItemImage.image = UIImage(named: "empty-image")
        }
    }

    private func setupStyle(){
        self.clipsToBounds = true
        self.backgroundColor = .productBackground
        self.layer.cornerRadius = 15

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1

        cartItemPrice.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        cartItemName.font = UIFont.systemFont(ofSize: 16, weight: .light)

        setupCheckBoxStyle()
        
    }
    
    private func setupCheckBoxStyle() {
        switch checkBox.isSelected{
        case true:
            checkBox.backgroundColor = UIColor(resource: .primary)
        case false:
            checkBox.backgroundColor = .systemGray
        }
        
        checkBox.layer.cornerRadius = 8
    }

}


protocol CartItemDelegate{
    
    func deleteCartItem(item: CartItem)
    
    func incrementCount(item: CartItem)
    
    func decrementCount(item: CartItem)
}

