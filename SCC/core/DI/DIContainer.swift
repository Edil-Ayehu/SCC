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
    
    lazy var tokenStorage: TokenStorage = {
        UserDefaultsTokenStorage()
    } ()
    
    lazy var authInterceptor: AuthInterceptor = {
        AuthInterceptor(tokenStorage: tokenStorage)
    } ()
    
    // Repositories
    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(apiClient: apiClient, tokenStorage: tokenStorage)
    } ()
    
    // MARK: Services
    
    lazy var apiClient: APIClient = {
        APIClient(interceptor: authInterceptor)
    } ()
    
    // MARK: ViewModels
    
    func makeSignInViewModel() -> SignInViewModel {
        SignInViewModel(repository: authRepository)
    }
    
    func makeSignUpViewModel() -> SignUpViewModel {
        SignUpViewModel(repository: authRepository)
    }
}
