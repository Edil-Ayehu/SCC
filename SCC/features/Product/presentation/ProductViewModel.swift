//
//  ProductViewModel.swift
//  SCC
//
//  Created by Edil on 02/07/2026.
//

import Foundation

@MainActor
final class ProductViewModel: ObservableObject {
    @Published var products: [ProductResponse] = []
    
    @Published var search = ""
    
    @Published var selectedCategory: String?
    
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func loadProducts() async {
        isLoading  = true
        
        defer {
            isLoading = false
        }
        
        do {
            products = try await repository.fetchProducts(
                category: selectedCategory,
                search: search.isEmpty ? nil : search
            )
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
