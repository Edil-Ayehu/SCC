//
//  ProductRepository.swift
//  SCC
//
//  Created by Edil on 02/07/2026.
//

import Foundation

protocol ProductRepository {
    
    func fetchProducts(
        category: String?,
        search: String?
    ) async throws -> [ProductResponse]
}
