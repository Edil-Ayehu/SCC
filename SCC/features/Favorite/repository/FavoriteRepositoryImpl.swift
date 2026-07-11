//
//  FavoriteRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//
import Foundation

final class FavoriteRepositoryImpl: FavoriteRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getFavorites() async throws -> [FavoriteResponse] {
        try await apiClient.request(
            endpoint: Endpoint.favorites,
        )
    }
    
    func createFavorite(
            request: CreateFavoriteRequest
        ) async throws -> FavoriteResponse {

            try await apiClient.request(
                endpoint: Endpoint.favorites,
                method: "POST",
                body: request
            )
        }
    
    func deleteFavorite(id: String) async throws -> DeleteFavoriteResponse {

            try await apiClient.request(
                endpoint: Endpoint.favorites+"/"+id,
                method: "DELETE"
            )
        }
}
