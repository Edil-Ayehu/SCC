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
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.red)
                }

            VStack(alignment: .leading, spacing: 6) {

                Text(favorite.name ?? "Favorite items")
                    .font(.custom("Outfit-Medium", size: 16))

                Text("\(favorite.items.count) products")
                    .font(.custom("Outfit-Regular", size: 14))
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
