//
//  ProfileViewModel.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//
import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var profile: ProfileResponse?
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var successMessage: String?
    
    private let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    
    func loadProfile() async {
        isLoading = true
        
        errorMessage = nil
        
        
        defer {
            isLoading = false
        }
        
        do {
            
            profile = try await repository.getProfile()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func changePassword(
        oldPassword: String,
        newPassword: String
    ) async {
        
        isLoading = true
        errorMessage = nil
        successMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let request = ChangePasswordRequest(
                oldPassword: oldPassword, newPassword: newPassword
            )
            
            let response = try await repository.changePassword(
                request: request
            )
            
            successMessage = response.message
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
