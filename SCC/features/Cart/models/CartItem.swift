//
//  CartItem.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//
import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let image: String?
    var quantity: Int
}

