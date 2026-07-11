//
//  CreateFavoriteRequest.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import Foundation

struct CreateFavoriteRequest: Encodable {

    let name: String?
    let items: [CreateFavoriteItemRequest]
}

struct CreateFavoriteItemRequest: Encodable {

    let productId: String
    let quantity: Int
}
