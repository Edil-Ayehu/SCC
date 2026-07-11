//
//  FavoriteResponse.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//


import Foundation

struct FavoriteResponse: Decodable, Identifiable, Hashable {

    let id: String
    let name: String?
    let storeId: String?
    let createdAt: String
    let items: [FavoriteItemResponse]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case storeId
        case createdAt
        case items
    }
}

struct FavoriteItemResponse: Decodable, Identifiable, Hashable {

    var id: String {
        productId
    }

    let productId: String
    let quantity: Int
    let product: FavoriteProductResponse

    enum CodingKeys: String, CodingKey {
        case productId
        case quantity
        case product
    }
}

struct FavoriteProductResponse: Decodable, Identifiable, Hashable {

    let id: String
    let name: String
    let description: String
    let price: Double?
    let image: String?
    let stockQuantity: Int
    let category: String
    let isActive: Bool
    let storeId: String?
    let barcode: String
    let stockInPrice: Double
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case image
        case stockQuantity
        case category
        case isActive
        case storeId
        case barcode
        case stockInPrice
        case createdAt
        case updatedAt
    }
}
