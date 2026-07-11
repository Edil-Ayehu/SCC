//
//  FavoritesView.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct FavoritesView: View {

    @Environment(\.dismiss) private var dismiss
    
    @StateObject var favoriteVM = DIContainer.shared.makeFavoriteViewModel()

    var body: some View {

        VStack(spacing: 0) {
            
            if favoriteVM.isLoading {
                ScrollView(showsIndicators: false) {

                    LazyVStack(spacing: 20) {

                        ForEach(0..<4, id: \.self) { _ in
                             FavoriteCardSkeleton()
                       }
                    }
                     .padding(20)
                  }
            } else {
                if favoriteVM.favorites.isEmpty {
                    EmptyStateView(
                          image: "heart.slash",
                          title: "No Favorites Yet",
                          message: "Products you add to your favorites will appear here."
                                    )
                } else {
                    ScrollView(showsIndicators: false) {

                        LazyVStack(spacing: 20) {

                            ForEach(favoriteVM.favorites) { favorite in
                                FavoriteCard(favorite: favorite)
                            }
                        }
                        .padding(20)
                    }
                }

            }
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white)
        .navigationBarTitle("My Favorites")
        .task {
            await favoriteVM.loadFavorites()
        }
    }
}

