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
    
    lazy var productRepository: ProductRepository = {
        ProductRepositoryImpl(apiClient: apiClient)
    } ()
    
    lazy var eventRepository: EventRepository = {
        EventRepositoryImpl(apiClient: apiClient)
    } ()
    
    lazy var cartRepository: CartRepository = {
        CartRepositoryImpl(service: cartService)
    } ()
    
    lazy var voucherRepository: VoucherRepository = {
        VoucherRepositoryImpl(apiClient: apiClient)
    } ()
    
    lazy var profileRepository: ProfileRepository = {
        ProfileRepositoryImpl(apiClient: apiClient)
    } ()
    
    lazy var myVoucherRepository: MyVoucherRepository = {
        MyVoucherRepositoryImpl(apiClient: apiClient)
    } ()
    
    lazy var favoriteRepository: FavoriteRepository = {
        FavoriteRepositoryImpl(apiClient: apiClient)
    } ()
    
    // MARK: Services
    
    lazy var apiClient: APIClient = {
        APIClient(interceptor: authInterceptor)
    } ()
    
    lazy var cartService = CartService()
    
    // MARK: ViewModels
    
    func makeSignInViewModel() -> SignInViewModel {
        SignInViewModel(repository: authRepository)
    }
    
    func makeSignUpViewModel() -> SignUpViewModel {
        SignUpViewModel(repository: authRepository)
    }
    
    func makeProductViewModel() -> ProductViewModel {
        ProductViewModel(repository: productRepository)
    }
    
    func makeEventViewModel() -> EventViewModel {
        EventViewModel(repository: eventRepository)
    }
    
    func makeCartViewModel() -> CartViewModel {
        CartViewModel(repository: cartRepository)
    }
    
    func makeVoucherViewModel() -> VoucherViewModel {
        VoucherViewModel(repository: voucherRepository)
    }
    
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(repository: profileRepository)
    }
    
    func makeMyVoucherViewModel() -> MyVoucherViewModel {
        MyVoucherViewModel(repository: myVoucherRepository)
    }
    
    func makeFavoriteViewModel() -> FavoriteViewModel {
        FavoriteViewModel(repository: favoriteRepository)
    }
    
}
