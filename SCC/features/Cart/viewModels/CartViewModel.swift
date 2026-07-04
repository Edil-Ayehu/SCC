//
//  CartViewModel.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import Foundation

@MainActor
final class CartViewModel: ObservableObject {

    @Published var items: [CartItem] = []

    private let repository: CartRepository

    init(repository: CartRepository) {
        self.repository = repository
        loadCart()
    }

    func loadCart() {
        items = repository.loadCart()
    }

    func add(product: ProductResponse) -> Bool {
        do {
            try repository.add(product: product)
            loadCart()
            return true
        } catch {
            print(error)
            return false
        }
    }

    func increase(_ item: CartItem) {
        do {
            try repository.increase(productId: item.product.id)
            loadCart()
        } catch {
            print(error)
        }
    }

    func decrease(_ item: CartItem) {
        do {
            try repository.decrease(productId: item.product.id)
            loadCart()
        } catch {
            print(error)
        }
    }

    func clearCart() {
        repository.clearCart()
        loadCart()
    }
    
    func isProductInCart(_ id: String) -> Bool {
        repository.isProductInCart(id)
    }
}
