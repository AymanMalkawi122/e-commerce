//
//  UIAplication.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 10/12/2023.
//

import UIKit

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.keyWindow

    }
    
    func setWindowRootViewController(viewController: UIViewController, animate: Bool = false){
        firstKeyWindow?.rootViewController = viewController
        
        if animate == true{
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.3
            UIView.transition(with: firstKeyWindow!, duration: duration, options: options, animations: {})
        }
    }
}
