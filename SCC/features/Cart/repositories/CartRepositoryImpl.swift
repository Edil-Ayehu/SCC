//
//  CartRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//
import Foundation

final class CartRepositoryImpl: CartRepository {

    private let service: CartService

    init(service: CartService) {
        self.service = service
    }

    func loadCart() -> [CartItem] {
        service.loadCart()
    }

    func clearCart() {
        service.clearCart()
    }

    func isProductInCart(_ productId: String) -> Bool {
        service.loadCart().contains {
            $0.product.id == productId
        }
    }

    func add(product: ProductResponse) throws {

        var items = service.loadCart()

        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {

            items[index].quantity += 1

        } else {

            items.append(
                CartItem(
                    id: UUID().uuidString,
                    product: product,
                    quantity: 1
                )
            )
        }

        try service.saveCart(items)
    }

    func increase(productId: String) throws {

        var items = service.loadCart()

        guard let index = items.firstIndex(where: {
            $0.product.id == productId
        }) else { return }

        items[index].quantity += 1

        try service.saveCart(items)
    }

    func decrease(productId: String) throws {

        var items = service.loadCart()

        guard let index = items.firstIndex(where: {
            $0.product.id == productId
        }) else { return }

        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }

        try service.saveCart(items)
    }

    func remove(productId: String) throws {

        var items = service.loadCart()

        items.removeAll {
            $0.product.id == productId
        }

        try service.saveCart(items)
    }
}
