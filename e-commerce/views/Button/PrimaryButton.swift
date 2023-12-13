//
//  PrimaryButton.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 03/12/2023.
//

import UIKit

class PrimaryButton: UIButton {

    override init(frame: CGRect) {
           super.init(frame: frame)
           setupDefaultStyle()
         }

      required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupDefaultStyle()
         }

      func setupDefaultStyle() {
           self.layer.cornerRadius = 3
           self.layer.masksToBounds = true
          self.tintColor = .white
          self.backgroundColor = .primary
          self.layer.borderWidth = 0
         }

    func setupSelectedStyle() {
         self.layer.cornerRadius = 3
         self.layer.masksToBounds = true
        self.tintColor = .primary
        self.backgroundColor = .secondary
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(resource: .primary).cgColor
       }
}
