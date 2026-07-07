//
//  ProfileRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

final class ProfileRepositoryImpl: ProfileRepository {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getProfile() async throws -> ProfileResponse {
        try await apiClient.request(
            endpoint: Endpoint.profile,
        )
    }
    
    func changePassword(
        request: ChangePasswordRequest
    ) async throws -> ChangePasswordResponse {
        try await apiClient.request(
            endpoint: Endpoint.changePassword,
            method: "POST",
            body: request
        )
    }
    
    func updateProfile(
        request: UpdateProfileRequest
    ) async throws -> ProfileResponse {
        try await apiClient.request(
            endpoint: Endpoint.updateProfile,
            method: "PATCH",
            body: request
        )
    }
}
