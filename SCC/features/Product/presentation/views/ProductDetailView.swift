//
//  ProductDetailView.swift
//  SCC
//
//  Created by Edil on 30/06/2026.
//

import SwiftUI

struct ProductDetailView: View {

    let product: ProductResponse

    @State private var quantity = 1

    var body: some View {

        VStack(spacing: 0) {

            ScrollView {

                VStack(alignment: .leading, spacing: 24) {

                    RemoteImage(
                        url: product.image,
                        height: 260,
                        cornerRadius: 24,
                        padding: 90
                    )

                    VStack(alignment: .leading, spacing: 18) {

                        HStack {

                            Text(product.category.name.uppercased())
                                .font(.custom("Outfit-Medium", size: 12))
                                .foregroundColor(.primaryPurple)

                            Spacer()

                        }

                        Text(product.name)
                            .font(.custom("Outfit-Medium", size: 18))


                        Divider()
                        
                        if let description = product.description,
                           !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            VStack(alignment: .leading, spacing: 8) {

                                Text("Description")
                                    .font(.custom("Outfit-Medium", size: 16))

                                Text(
                                    product.description?.isEmpty == false
                                    ? product.description!
                                    : "No description available."
                                )
                                .font(.custom("Outfit-Regular", size: 14))
                                .foregroundColor(.secondary)
                            }
                            
                            Divider()
                        }


                        HStack {

                            Text("Quantity")
                                .font(.custom("Outfit-SemiBold", size: 16))

                            Spacer()

                            HStack(spacing: 20) {

                                Button {
                                    if quantity > 1 {
                                        quantity -= 1
                                    }
                                } label: {
                                    Image(systemName: "minus")
                                }

                                Text("\(quantity)")
                                    .font(.custom("Outfit-SemiBold", size: 16))

                                Button {
                                    quantity += 1
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal,10)
                }
                .padding()
            }

            CustomButton(
                title: "Add to Cart",
                action: {

                },
                height: 56
            )
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
