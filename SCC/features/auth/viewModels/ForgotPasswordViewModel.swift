//
//  ForgotPasswordViewModel.swift
//  SCC
//
//  Created by Edil on 13/07/2026.
//
import Foundation

@MainActor
final class ForgotPasswordViewModel: ObservableObject {
    private let repository: AuthRepository
    
    @Published var isLoading: Bool = false
    
    @Published var response: ForgotPasswordResponse?
    
    @Published var successMessage: String?
    @Published var errorMessage: String?
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func sendOTP(phone: String) async {
        isLoading = true
        errorMessage = nil
        successMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await repository.forgotPassword(phone: "+27\(phone)")
            
            self.response = response
            
            successMessage = response.message
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
