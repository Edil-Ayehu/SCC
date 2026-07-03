//
//  ProductCard.swift
//  SCC
//
//  Created by Edil on 25/06/2026.
//

import SwiftUI

struct ProductCard: View {

    let product: ProductResponse

    var body: some View {
        let imageURL: URL? = {
            guard let image = product.image,
                  !image.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            else {
                return nil
            }
            return URL(string: image)
        }()
        VStack(alignment: .leading, spacing: 12) {
            
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()

                case .failure(_), .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .padding(30)
                        .background(Color.gray.opacity(0.1))

                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .padding(30)
                        .background(Color.gray.opacity(0.1))
                }
            }
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            VStack (alignment: .leading){
                Text(product.category.name)
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.cyan)

                Text(product.name)
                    .font(.custom("Outfit-Medium", size: 16))
                    .foregroundColor(.black)
                    .lineLimit(2)

                HStack {
                    Spacer()

                    Button {

                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 38, height: 38)
                            .background(
                                Circle()
                                    .fill(Color(red: 20/255,
                                                green: 27/255,
                                                blue: 93/255))
                            )
                    }
                }
            }
            .padding(12)


        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(
            color: .black.opacity(0.05),
            radius: 12,
            x: 0,
            y: 6
        )
    }
}

