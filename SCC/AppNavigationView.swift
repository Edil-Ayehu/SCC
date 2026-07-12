//
//  AppNavigationView.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

struct AppNavigationView: View {
    @StateObject private var router = AppRouter()
        
    var body: some View {
        NavigationStack(path: $router.path) {
            rootView
                .navigationDestination(for: AppRoute.self) {route in
                    switch route {
                        
                    case .signIn:
                        SignInView()
                        
                    case .signUp:
                        SignupView()
                        
                    case .forgotPassword:
                        ForgotPasswordView()
                        
                    case .home:
                        HomeView()
                        
                    case .stores:
                        StoresView()
                        
                        
                    case .productDetails(let product):
                        ProductDetailView(product: product)
                        
                    case .changePassword:
                        ChangePasswordView()
                        
                    case .editProfileView(let profile):
                        EditProfileView(profile: profile)
                        
                    case .favoriteView:
                        FavoritesView()
                        
                    case .favoriteDetailView(let favorite):
                        FavoriteDetailView(favorite: favorite)
                        
                    case .resetPasswordView(let phoneNumber):
                        ResetPasswordView(phoneNumber: phoneNumber)
                    }
                }
        }
        .environmentObject(router)
    }
    
    @ViewBuilder
    private var rootView: some View {
        switch router.root {
        case .signIn:
            SignInView()
            
        case .home:
            HomeView()
            
        case .signUp:
            SignupView()
            
        case .forgotPassword:
            ForgotPasswordView()
            
        case .stores:
            StoresView()
            
        case .productDetails(let product):
            ProductDetailView(product: product)
            
        case .changePassword:
            ChangePasswordView()
            
        case .editProfileView(let profile):
            EditProfileView(profile: profile)
            
        case .favoriteView:
            FavoritesView()
            
        case .favoriteDetailView(let favorite):
            FavoriteDetailView(favorite: favorite)
            
        case .resetPasswordView(let phoneNumber):
            ResetPasswordView(phoneNumber: phoneNumber)
        }
    }
}

