//
//  Product.swift
//  ProductList
//
//  Created by Zakir Khan on 21/09/2025.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
    
}

struct Rate: Codable {
    let rate: Float
    let count: Int
}
