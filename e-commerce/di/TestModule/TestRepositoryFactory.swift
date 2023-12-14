//
//  DefaultModule.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class TestRepositoryFactory{
    private static var database: DataBase!
    private static var apiManager: APIManager!
    private static var cacheLayer: CacheLayer!
    private static var shared:Repository!
    
    func getInstance() -> Repository{
        guard let instance = TestRepositoryFactory.shared else {
            
            TestRepositoryFactory.database = DefaultDataBaseFactory().getInstance()
            TestRepositoryFactory.apiManager = APIManagerFactory().getInstance()
            TestRepositoryFactory.cacheLayer = CacheLayerFactory().getInstance()
            
            TestRepositoryFactory.shared = RepositoryImpl(
                apiManager: TestRepositoryFactory.apiManager,
                cacheLayer: TestRepositoryFactory.cacheLayer,
                database:   TestRepositoryFactory.database
            )
            
            return TestRepositoryFactory.shared
        }
        return instance
    }
}
