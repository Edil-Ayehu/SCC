//
//  ProductDetailView.swift
//  SCC
//
//  Created by Edil on 30/06/2026.
//

import SwiftUI
import AlertToast

struct ProductDetailView: View {

    let product: ProductResponse

    @State private var quantity = 1
    
    @StateObject private var cartVM = DIContainer.shared.makeCartViewModel()
    
    @State private var showToast = false
    
    @EnvironmentObject var router: AppRouter

    var body: some View {

        VStack(spacing: 0) {
            
            HStack(spacing: 16) {

                Button {
                    router.pop()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }

                Text("Product Details")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

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

                            Text(product.category?.name.uppercased() ?? "")
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
                    }
                    .padding(.horizontal,10)
                }
                .padding()
            }

            CustomButton(
                title: cartVM.isProductInCart(product.id) ? "Already in Cart" : "Add to Cart",
                action: {
                    if cartVM.add(product: product) {
                        showToast = true
                    }
                },
                isEnabled: cartVM.isProductInCart(product.id) == false,
                height: 56
            )
            .padding()
        }
//        .navigationTitle("Product Details")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toast(isPresenting: $showToast) {
            AlertToast(
                displayMode: .alert,
                type: .complete(.green),
                title: "\(product.name) added to Cart!"
            )
        }
    }
}
