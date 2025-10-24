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
}

enum EndPointsItems {
    case products
}
//https://fakestoreapi.com/products
extension EndPointsItems: EndPointType {
    var path: String {
        switch self {
        case .products:
            return "products"
        }
   
    }
    
    var baseUrl: String {
         return  "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return (URL(string: "\(baseUrl)\(path)"))
    }
    
    var method: HttpMethods {
        switch self {
        case .products:
            return .get
        }
    }
    
    
}
