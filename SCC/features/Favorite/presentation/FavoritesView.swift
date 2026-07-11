//
//  FavoritesView.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct FavoritesView: View {

    @Environment(\.dismiss) private var dismiss

    let favorites: [FavoriteCollection] = FavoriteCollection.sample

    var body: some View {

        VStack(spacing: 0) {
            
            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 20) {

                    ForEach(favorites) { favorite in
                        FavoriteCard(favorite: favorite)
                    }
                }
                .padding(20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white)
        .navigationBarTitle("My Favorites")
    }
}

