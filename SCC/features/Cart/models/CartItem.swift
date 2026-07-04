//
//  CartItem.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//
import Foundation

struct CartItem: Codable, Identifiable, Hashable {
    let id: String
    let product: ProductResponse
    var quantity: Int
}

