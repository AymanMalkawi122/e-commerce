//
//  APIManagerFactory.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class TestAPIManagerFactory{
    private static var shared:APIManager = AlamoFireManager()
    
    func getInstance() -> APIManager{
        TestAPIManagerFactory.shared
    }
}
