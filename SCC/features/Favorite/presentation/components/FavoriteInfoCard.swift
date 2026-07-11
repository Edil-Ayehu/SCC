//
//  FavoriteInfoCard.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//
import SwiftUI

struct FavoriteInfoCard: View {

    let favorite: FavoriteResponse

    var body: some View {

        HStack(spacing: 16) {

            RoundedRectangle(cornerRadius: 18)
                .fill(Color.red.opacity(0.08))
                .frame(width: 70, height: 70)
                .overlay {
                    Image(systemName: "heart.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }

            VStack(alignment: .leading, spacing: 6) {

                Text(favorite.name ?? "Favorite items")
                    .font(.custom("Outfit-SemiBold", size: 20))

                Text("\(favorite.items.count) products")
                    .font(.custom("Outfit-Regular", size: 15))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(
            color: .black.opacity(0.05),
            radius: 12,
            y: 4
        )
    }
}
