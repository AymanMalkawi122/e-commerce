//
//  DefaultModule.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class DefaultRepositoryFactory{

    
    private static var database: DataBase!
    private static var apiManager: APIManager!
    private static var cacheLayer: CacheLayer!
    private static var shared:Repository!
    
    func getInstance() -> Repository{
        guard let instance = DefaultRepositoryFactory.shared else {
            
            DefaultRepositoryFactory.database = DefaultDataBaseFactory().getInstance()
            DefaultRepositoryFactory.apiManager = APIManagerFactory().getInstance()
            DefaultRepositoryFactory.cacheLayer = CacheLayerFactory().getInstance()
            
            DefaultRepositoryFactory.shared = RepositoryImpl(
                apiManager: DefaultRepositoryFactory.apiManager,
                cacheLayer: DefaultRepositoryFactory.cacheLayer,
                database: DefaultRepositoryFactory.database
            )
    
            return DefaultRepositoryFactory.shared
        }
        return instance
    }
}
