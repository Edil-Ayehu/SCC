//
//  ProductResponse.swift
//  SCC
//
//  Created by Edil on 02/07/2026.
//

import Foundation

struct ProductResponse: Codable, Identifiable, Hashable {

    let id: String
    let name: String
    let description: String?
    let image: String?

    var category: ProductCategory?
 
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image

        case category
    }
}

struct ProductCategory: Codable, Hashable {

    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
