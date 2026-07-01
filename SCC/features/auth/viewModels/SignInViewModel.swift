//
//  SignInViewModel.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var phoneNumber = ""
    @Published var password = ""
    
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
            
            let response = try await repository.login(phoneNumber: "+27" + phoneNumber, password: password)
            
            print(response.accessToken)
            print(response.user.name)
            
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
