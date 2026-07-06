//
//  SignInViewModel.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var phoneNumber = "930884422"
    @Published var password = "654321"
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLoggedIn = false
    
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func login() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            
            let response = try await repository.login(
                phone: "+27" + phoneNumber,
                password: password
            )
            
            print(response.accessToken)
            print(response.user.name)
            
            isLoggedIn = true
        } catch {
            print("Setting error:", error.localizedDescription)
            
            errorMessage = nil

                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
        }
    }
}
