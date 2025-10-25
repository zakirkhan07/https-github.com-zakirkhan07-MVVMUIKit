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

 typealias Handler<T> = (Result<T, ProductError>) -> Void

final class APIManager {
    static  let  shared = APIManager()
    private init () {}
    
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
    ){//URL(string: Constant.API.productUrl)
        guard let url = type.url else {
            
            return
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        
        if let parameter = type.body {
            request.httpBody = try? JSONEncoder().encode(parameter)
        }
        request.allHTTPHeaderFields = type.headers
      
        
        URLSession.shared.dataTask(with: request)  {data, response, error in
            
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
                let productData = try JSONDecoder().decode(modelType, from: data)
                completion(.success(productData))
            }
            catch {
                completion(.failure(.network(error)))
            }
            
       }.resume()
    }
   // its returning when ever i need it will accessed it without storing it in memory
    static var commanHeadeer: [String: String] {
        return ["content-type": "application/json"]
    }
    
   
    
}
//model to datA - ENCODABLE
//DATA TO MODEL , DECODABLE

//FOR BOTH -> CODABLE ITS A TYPE ALLIAS
