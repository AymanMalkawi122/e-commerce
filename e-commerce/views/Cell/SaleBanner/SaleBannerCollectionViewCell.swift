//
//  SaleBannerCollectionViewCell.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 28/11/2023.
//

import UIKit

class SaleBannerCollectionViewCell: UICollectionViewCell {

    static let identifier = "Banner Cell"
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        bannerImage.layer.cornerRadius = 15
        bannerImage.contentMode = .scaleAspectFill
        
    }
    
    func configure(using imageName:String){
        bannerImage?.image = UIImage(named: imageName)
    }

}
