//
//  CacheImpl.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 04/12/2023.
//

import Foundation

class CacheLayerImpl: CacheLayer{
    private var _cacheIsValid = false
    
    func getProducts(handler: @escaping ([Product]) -> (Void)) {
        
        let data = readLocalJSONFile(forName: "products")
        do{
            let jsonData = try JSONDecoder().decode([Product].self, from: data)
            handler(jsonData)
        } catch {
            print("\(error)")
        }
    }
    
    func getProductByID(ID productID: Int, handler: @escaping (Product) -> (Void)) {
        
        let data = readLocalJSONFile(forName: "products")
        do{
            let jsonData = try JSONDecoder().decode([Product].self, from: data)
            let product = jsonData.filter{ (product)->Bool in
                return product.id == productID
            }[0]
            handler(product)
        } catch {
            print("\(error)")
        }
    }
    
    private func readLocalJSONFile(forName name: String) -> Data {
        guard let filePath = Bundle.main.url(forResource: name, withExtension: "json") else{
            fatalError("json file \"\(name)\" not found")
        }
        guard let data = try? Data(contentsOf: filePath) else{
            fatalError("could not conver data for file name [\(name)]")
        }
        return data
    }
    
    func cacheIsValid()-> Bool{
        _cacheIsValid
    }
}
