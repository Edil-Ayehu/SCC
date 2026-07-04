//
//  CartService.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import Foundation

final class CartService {

    private let storageKey = "cart_items"

    func loadCart() -> [CartItem] {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            return []
        }

        do {
            return try JSONDecoder().decode([CartItem].self, from: data)
        } catch {
            return []
        }
    }

    func saveCart(_ items: [CartItem]) throws {
        let data = try JSONEncoder().encode(items)
        UserDefaults.standard.set(data, forKey: storageKey)
    }

    func clearCart() {
        UserDefaults.standard.removeObject(forKey: storageKey)
    }
}

