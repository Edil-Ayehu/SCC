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
    
    @Published var isDeleting: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var deleteMessage: String?
    
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
    
    func deleteFavorite(id: String) async {

        isDeleting = true
        errorMessage = nil

        defer {
            isDeleting = false
        }

        do {

            let response = try await repository.deleteFavorite(id: id)

            deleteMessage = response.message

            favorites.removeAll { $0.id == id }

        } catch {

            errorMessage = error.localizedDescription
        }
    }
    
}
