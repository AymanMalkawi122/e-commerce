//
//  SecondaryButton.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 03/12/2023.
//

import UIKit

class SecondaryButton: UIButton {

    override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
         }

      required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setup()
         }

      private func setup() {
           self.layer.cornerRadius = 3
           self.layer.masksToBounds = true
          self.tintColor = .primary
          self.backgroundColor = .secondary
         }

}
