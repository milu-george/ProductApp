//
//  ProductModel.swift
//  ProductApp
//
//  Created by Milu Ann George on 28/11/23.
//

import Foundation


struct Welcome: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}


struct Product: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
