//
//  FavoriteCollection.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import Foundation

struct FavoriteCollection: Identifiable, Equatable, Hashable {

    let id = UUID()

    let name: String
    
    let products: [FavoriteProduct]
}

struct FavoriteProduct: Identifiable, Equatable, Hashable {

    let id = UUID()
    let name: String
    let image: String?
    let quantity: Int
}

extension FavoriteCollection {

    static let sample: [FavoriteCollection] = [
        FavoriteCollection(
            name: "Weekly Grocery",
            products: [
                FavoriteProduct(
                    name: "Cooking Oil 5L",
                    image: "https://picsum.photos/200",
                    quantity: 1
                ),
                FavoriteProduct(
                    name: "Switch",
                    image: nil,
                    quantity: 1
                ),
                FavoriteProduct(
                    name: "New Product",
                    image: "https://picsum.photos/201",
                    quantity: 2
                )
            ]
        ),
        FavoriteCollection(
            name: "Monthly Shopping",
            products: [
                FavoriteProduct(
                    name: "Rice",
                    image: "https://picsum.photos/202",
                    quantity: 2
                ),
                FavoriteProduct(
                    name: "Sugar",
                    image: "https://picsum.photos/203",
                    quantity: 1
                )
            ]
        )
    ]
}
