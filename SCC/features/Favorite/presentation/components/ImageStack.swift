//
//  ImageStack.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//

import SwiftUI

struct ImageStack: View {

    let products: [FavoriteItemResponse]

    var body: some View {

        HStack(spacing: -14) {

            ForEach(products.prefix(3)) { item in

                AsyncImage(url: URL(string: item.product.image ?? "")) { phase in

                    switch phase {

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()

                    default:
                        Circle()
                            .fill(Color.gray.opacity(0.4))
                            .overlay {
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            }
                    }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth: 3)
                )
            }
        }
    }
}
