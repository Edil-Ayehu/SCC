//
//  FavoriteViewModel.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//
import Foundation

@MainActor
final class FavoriteViewModel: ObservableObject {
    @Published var favorites: [FavoriteResponse] = []
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    private let repository: FavoriteRepository
    
    init(repository: FavoriteRepository) {
        self.repository = repository
    }
    
    func loadFavorites() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            favorites = try await repository.getFavorites()
            
        }catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
