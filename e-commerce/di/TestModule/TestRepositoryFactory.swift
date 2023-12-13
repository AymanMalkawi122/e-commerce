//
//  DefaultModule.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class TestRepositoryFactory{
    private static let database = TestDataBaseFactory().getInstance()
    private static let apiManager = TestAPIManagerFactory().getInstance()
    private static let cacheLayer = TestCacheLayerFactory().getInstance()
    
    private static var shared:Repository = RepositoryImpl(apiManager: apiManager , cacheLayer: cacheLayer, database: database)
    
    func getInstance() -> Repository{
            return TestRepositoryFactory.shared
        }

    
    
}
