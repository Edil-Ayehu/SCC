//
//  CartView.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct CartView: View {

    @State private var items: [CartItem] = [
        CartItem(name: "Coffee Roaster", image: nil, quantity: 1),
        CartItem(name: "cake wheat flour", image: nil, quantity: 2),
        CartItem(name: "Coffee", image: nil, quantity: 4)
    ]

    var body: some View {
        VStack(spacing: 0) {

            // Header
            HStack {
                Spacer()

                Text("My Cart")
                    .font(.custom("Outfit-SemiBold", size: 22))

                Spacer()

                Button {

                } label: {
                    Image(systemName: "trash")
                        .font(.title2)
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 18) {

                    ForEach($items) { $item in
                        CartItemCard(item: $item)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)

                Spacer()
                    .frame(height: 40)
            }

            Divider()

            HStack(spacing: 16) {
                
                CustomButton(
                    title: "Generate Voucher",
                    action: {},
                    height: 42
                )


                Button {

                } label: {
                    Text("Add to Favorite")
                        .font(.custom("Outfit-Medium", size: 16))
                        .foregroundColor(.primaryPurple)
                        .frame(maxWidth: .infinity)
                        .frame(height: 42)
                        .overlay(
                            Capsule()
                                .stroke(Color.primaryPurple, lineWidth: 1.5)
                        )
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
        }
        .background(Color.white)
    }
}
