//
//  AuthRepositoryImpl.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

final class AuthRepositoryImpl: AuthRepository {
    
    private let apiClient: APIClient
    private let tokenStorage: TokenStorage
    
    init(apiClient: APIClient, tokenStorage: TokenStorage) {
        self.apiClient = apiClient
        self.tokenStorage = tokenStorage
    }
    
    func login(
        phone: String,
        password: String
    ) async throws -> LoginResponse {
        let request = LoginRequest(
            phone: phone,
            password: password
        )
        
        let response: LoginResponse =  try await apiClient.request(
            endpoint: Endpoint.login,
            method: "POST",
            body: request
        )
        
        tokenStorage.save(token: response.accessToken)
        
        return response
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
            endpoint: Endpoint.register,
            method: "POST",
            body: request
        )
    }
    
    func logout() async throws {

            // Simulate API call
            try await Task.sleep(for: .seconds(2))

            tokenStorage.clear()
        }
}
