//
//  APIManagerFactory.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class APIManagerFactory{
    private static var shared:APIManager = AlamoFireManager()
    
    func getInstance() -> APIManager{
        APIManagerFactory.shared
    }
}
