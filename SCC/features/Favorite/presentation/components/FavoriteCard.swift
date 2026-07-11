//
//  FavoriteCard.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct FavoriteCard: View {

    let favorite: FavoriteResponse
    
    @EnvironmentObject var router: AppRouter

    var body: some View {
        
        Button{
            router.push(.favoriteDetailView(favorite))
        } label: {
            VStack(alignment: .leading, spacing: 22) {

                // Header

                HStack(alignment: .top) {

                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.red.opacity(0.08))
                        .frame(width: 50, height: 50)
                        .overlay {

                            Image(systemName: "heart.fill")
                                .font(.system(size: 18))
                                .foregroundColor(.red)
                        }

                    VStack(alignment: .leading, spacing: 6) {

                        Text(favorite.name ?? "Favorite items")
                            .font(.custom("Outfit-Medium", size: 16))
                            .foregroundColor(.black)

                        HStack(spacing: 6) {

                            Image(systemName: "clock")
                                .foregroundColor(.gray)

                            Text(favorite.createdAt.formattedDate())
                                .foregroundColor(.gray)
                        }
                        .font(.custom("Outfit-Regular", size: 14))
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.system(size: 18))
                        .foregroundColor(.black.opacity(0.5))
                }

                // Bottom

                HStack {

                    ImageStack(products: favorite.items)

                    Spacer()

                    Text("\(favorite.items.count) Items")
                        .font(.custom("Outfit-Medium", size: 14))
                        .foregroundColor(.green)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(Color.green.opacity(0.12))
                        .clipShape(Capsule())
                }
            }
            .padding(22)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .shadow(
                color: .black.opacity(0.05),
                radius: 14,
                y: 5
            )
        }

    }
}
