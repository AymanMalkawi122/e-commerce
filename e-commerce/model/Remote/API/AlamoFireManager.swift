//
//  APIManager.swift
//  e-commerce
//
//  Created by Ayman Malkawi on 27/11/2023.
//

import Foundation
import Alamofire

class AlamoFireManager: APIManager{
     
    static var sharedInstance = AlamoFireManager()
    
    func getProducts( handler: @escaping (_ products:[Product])->(Void) ){
        let url = Constatnts.Urls.ALL_PRODUCTS
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
               .response{ resp in
                   switch resp.result{
                     case .success(let data):
                       do{
                         let jsonData = try JSONDecoder().decode([Product].self, from: data!)
                         handler(jsonData)
                      } catch {
                         print("\(error)")
                      }
                    case .failure(let error):
                      print(error.localizedDescription)
                    }
               }
        }
    
    func getProductByID(ID productID:Int, handler: @escaping (_ product:Product) -> (Void)) {
        let url = Constatnts.Urls.PRODUCT_BY_ID(productID)
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
               .response{ resp in
                   switch resp.result{
                     case .success(let data):
                       do{
                         let jsonData = try JSONDecoder().decode(Product.self, from: data!)
                         handler(jsonData)
                      } catch {
                         print("\(error)")
                      }
                    case .failure(let error):
                      print(error.localizedDescription)
                    }
               }
    }
    
}
