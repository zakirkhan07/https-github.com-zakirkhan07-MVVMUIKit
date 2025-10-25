//
//  EndPointType.swift
//  ProductList
//
//  Created by Zakir Khan on 24/10/2025.
//

import Foundation

enum HttpMethods: String {
    case get =  "GET"
    case post = "POST"
}


protocol EndPointType {
    var path: String {get}
    var baseUrl: String {get}
    var url : URL? {get}
    var method: HttpMethods {get}
    var body: Encodable? {get}
    var headers: [String: String] {get}
}

enum EndPointsItems {
    case products
    case addProduct(product: AddProduct)
    
}
//https://fakestoreapi.com/products
extension EndPointsItems: EndPointType {
    
    var headers: [String : String] {
        return APIManager.commanHeadeer
    }
    
    var path: String {
        switch self {
        case .products:
            return "products"
        case .addProduct:
            return "products/add"
        }
   
    }
    
    var baseUrl: String {
        switch self {
        case .products:
            return  "https://fakestoreapi.com/"
        case  .addProduct:
             return "https://dummyjson.com/"
        }
         
    }
    
    var url: URL? {
        return (URL(string: "\(baseUrl)\(path)"))
    }
    
    var method: HttpMethods {
        switch self {
        case .products:
            return .get
        case .addProduct:
            return .post
        }
    }
    
    var body: (any Encodable)? {
        switch self {
        case .products:
            return nil
        
            case .addProduct(product: let product):
            return product
        }
    }
    
}
