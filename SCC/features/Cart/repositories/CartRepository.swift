//
//  CartRepository.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

protocol CartRepository {

    func loadCart() -> [CartItem]

    func add(product: ProductResponse) throws

    func increase(productId: String) throws

    func decrease(productId: String) throws

    func remove(productId: String) throws

    func clearCart()

    func isProductInCart(_ productId: String) -> Bool
}
