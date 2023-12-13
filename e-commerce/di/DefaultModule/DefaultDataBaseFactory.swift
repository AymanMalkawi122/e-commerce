//
//  DefaultDataBaseFactory.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 06/12/2023.
//

import Foundation

class DefaultDataBaseFactory{
    private static var shared:DataBase!
    
    func getInstance() -> DataBase{
        guard let instance = DefaultDataBaseFactory.shared else{
            DefaultDataBaseFactory.shared = FireBase()
            return DefaultDataBaseFactory.shared
        }
        return instance
    }
}
