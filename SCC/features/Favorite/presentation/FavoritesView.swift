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
    
    @EnvironmentObject var router: AppRouter

    var body: some View {

        VStack(spacing: 0) {
            
            HStack {
                Button {
                    router.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primary)
                }
                
                Text("Favorites")
                    .font(.custom("Outfit-Medium", size: 16))
                    .foregroundColor(.primary)
                    .padding()
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            
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
        .navigationBarBackButtonHidden(true)
        .task {
            await favoriteVM.loadFavorites()
        }
    }
}

