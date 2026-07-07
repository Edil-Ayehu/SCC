//
//  ProfileRepository.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

protocol ProfileRepository {
    
    func getProfile() async throws -> ProfileResponse
    
    func changePassword(
        request: ChangePasswordRequest
    ) async throws -> ChangePasswordResponse
    
    func updateProfile(
        request: UpdateProfileRequest
    ) async throws -> ProfileResponse
}
