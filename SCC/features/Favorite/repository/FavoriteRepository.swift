//
//  FavoriteRepository.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

protocol FavoriteRepository {
    func getFavorites() async throws -> [FavoriteResponse]
}
