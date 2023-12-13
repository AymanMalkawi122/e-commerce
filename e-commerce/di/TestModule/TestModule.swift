//
//  DefaultModule.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 05/12/2023.
//

import Foundation

class TestModule:DependancyModule{
    init(){
        print("ATTENTION!!\t\tCuurently using TestModule\t\tATTENTION!!\n")

    }
    func provideRepository() -> Repository {
        return TestRepositoryFactory().getInstance()
    }
}
