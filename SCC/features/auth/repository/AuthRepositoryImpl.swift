//
//  AuthRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

final class AuthRepositoryImpl: AuthRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func login(
        phoneNumber: String,
        password: String
    ) async throws -> LoginResponse {
        let request = LoginRequest(
            phone: phoneNumber,
            password: password
        )
        
        return try await apiClient.request(
            endpoint: "https://cash-carry-smart-ordering-system.onrender.com/auth/login",
            method: "POST",
            body: request
        )
    }
    
    func register(
        phone: String,
        password: String,
        email: String?,
        name: String
    ) async throws -> SignUpResponse {
        let request = SignUpRequest(
            phone: phone,
            email: email,
            password: password,
            name: name,
        )
        
        
        return try await apiClient.request(
            endpoint: "https://cash-carry-smart-ordering-system.onrender.com/auth/register",
            method: "POST",
            body: request
        )
    }
}
