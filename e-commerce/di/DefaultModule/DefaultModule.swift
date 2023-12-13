//
//  DefaultModule.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import Foundation

class DefaultModule:DependancyModule{
    init(){
        print("ATTENTION!!\t\tCuurently using DefaultModule\t\tATTENTION!!\n")
    }
    
    func provideRepository() -> Repository {
        DefaultRepositoryFactory().getInstance()
    }
}
