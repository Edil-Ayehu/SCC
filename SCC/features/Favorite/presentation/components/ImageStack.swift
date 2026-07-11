//
//  ImageStack.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct ImageStack: View {

    let products: [FavoriteProduct]

    var body: some View {

        HStack(spacing: -14) {

            ForEach(Array(products.prefix(3).enumerated()), id: \.element.id) { _, product in

                AsyncImage(url: URL(string: product.image ?? "")) { phase in

                    switch phase {

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()

                    default:
                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .overlay {
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            }
                    }

                }
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                )
            }
        }
    }
}
