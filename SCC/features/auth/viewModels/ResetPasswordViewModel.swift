//
//  ResetPasswordViewModel.swift
//  SCC
//
//  Created by Edil on 13/07/2026.
//
import Foundation


@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var isLoading = false
    
    @Published var errorMessage: String?
    
    @Published var response: ResetPasswordResponse?
    
    @Published var successMessage: String?
    
    private var repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func resetPassword(
        phone: String,
        code: String,
        newPassword: String
    ) async {
        isLoading = true
        
        errorMessage = nil
        
        successMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await repository.resetPassword(
                phone: "+27\(phone)",
                code: code,
                newPassword: newPassword
            )
            
            self.response = response
            
            self.successMessage = response.message
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
