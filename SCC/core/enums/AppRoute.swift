//
//  AppRoute.swift
//  SCC
//
//  Created by Edil on 19/06/2026.
//

import SwiftUI

enum AppRoute: Hashable {
    case signIn
    case signUp
    case forgotPassword
    case home
    case stores
    case productDetails(ProductResponse)
    case changePassword
    case editProfileView(ProfileResponse)
    case favoriteView
    case favoriteDetailView(FavoriteResponse)
    case resetPasswordView(String)
}
