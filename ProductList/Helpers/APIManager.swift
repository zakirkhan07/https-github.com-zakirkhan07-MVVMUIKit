//
//  APIManager.swift
//  ProductList
//
//  Created by Zakir Khan on 21/09/2025.
//

import UIKit

enum ProductError: Error {
    case invalidReponse
    case invalidData
    case decodingFailed
    case urlCreationFailed
    case network(Error)
    
}

 typealias Handler = (Result<[Product], ProductError>) -> Void

final class APIManager {
    static  let  shared = APIManager()
    private init () {}
    
    func fetchProduct(completion: @escaping Handler ) {
        guard let url = URL(string: Constant.API.productUrl) else {
            
            return
            
        }
        URLSession.shared.dataTask(with: url)  {data, response, error in
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
        
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidReponse))
                return
            }
            do {
                let productData = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(productData))
            }
            catch {
                completion(.failure(.network(error)))
            }
            
       }.resume()
        

    }
    
   
    
}
