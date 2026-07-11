//
//  FavoriteProductRwo.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//
import SwiftUI

struct FavoriteProductRow: View {

    let product: FavoriteProduct

    var body: some View {

        HStack(alignment: .top, spacing: 16) {

            RemoteImage(
                url: product.image,
                height: 72,
                width: 72,
                cornerRadius: 18,
                padding: 18
            )

            VStack(alignment: .leading, spacing: 10) {

                Text(product.name)
                    .font(.custom("Outfit-Medium", size: 18))

                Text("Qty \(product.quantity)")
                    .font(.custom("Outfit-SemiBold", size: 15))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.12))
                    .clipShape(Capsule())
            }

            Spacer()
        }
    }
}
