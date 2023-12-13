//
//  CacheLayerFactory.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class TestCacheLayerFactory{
    private static var shared:CacheLayer = CacheLayerImpl()
    
    func getInstance() -> CacheLayer{
        TestCacheLayerFactory.shared
    }
}
