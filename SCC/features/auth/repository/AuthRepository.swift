//
//  AuthRepository.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//


protocol AuthRepository {
    
    func login(
        phoneNumber: String,
        password: String
    ) async throws -> LoginResponse
}
