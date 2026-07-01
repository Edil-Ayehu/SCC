//
//  DIContainer.swift
//  SCC
//
//  Created by Edil on 01/07/2026.
//

import Foundation

@MainActor
final class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    // Repositories
    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(apiClient: apiClient)
    } ()
    
    // MARK: Services
    
    lazy var apiClient: APIClient = {
        APIClient()
    } ()
    
    // MARK: ViewModels
    
    func makeSignInViewModel() -> SignInViewModel {
        SignInViewModel(repository: authRepository)
    }
    
    func makeSignUpViewModel() -> SignUpViewModel {
        SignUpViewModel(repository: authRepository)
    }
}
