//
//  SignUpViewModel.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var phone = ""
    @Published var name = ""
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLoggedIn = false
    
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func register() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await repository.register(
                phone: "+27" + phone,
                password: password,
                email: email,
                name: name
            )
            
            print(response)
            
            isLoggedIn = true
            
        } catch {
            errorMessage = nil
            
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
