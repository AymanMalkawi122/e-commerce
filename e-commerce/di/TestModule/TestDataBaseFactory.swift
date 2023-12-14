//
//  TestDataBaseFactory.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 06/12/2023.
//

import Foundation

class TestDataBaseFactory{
    private static var shared:DataBase!
    
    func getInstance() -> DataBase{
        guard let instance = TestDataBaseFactory.shared else{
            TestDataBaseFactory.shared = FireBase()
            return TestDataBaseFactory.shared
        }
        
        return instance
    }
}
