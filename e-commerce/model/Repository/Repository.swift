//
//  Repository.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

protocol Repository: APIManager, DataBase{
    
    var apiManager: APIManager { get set}
    var cacheLayer: CacheLayer { get set}
    var database: DataBase {get set}
    
    
    init(apiManager:APIManager, cacheLayer:CacheLayer, database: DataBase)
    
    
}
