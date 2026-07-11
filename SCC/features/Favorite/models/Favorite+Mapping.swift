//
//  Favorite+Mapping.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import Foundation

extension FavoriteProductResponse {

    var asProductResponse: ProductResponse {
        ProductResponse(
            id: id,
            name: name,
            description: description,
            image: image
            
        )
    }
}

extension FavoriteItemResponse {

    var asCartItem: CartItem {
        CartItem(
            id: productId,
            product: product.asProductResponse,
            quantity: quantity
        )
    }
}
