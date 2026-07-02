//
//  ProductRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 02/07/2026.
//

final class ProductRepositoryImpl: ProductRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchProducts(
        category: String?,
        search: String?
    ) async throws -> [ProductResponse] {
        try await apiClient.request(
            endpoint: Endpoint.Product.list(
                category: category,
                search: search
            )
        )
    }
}
