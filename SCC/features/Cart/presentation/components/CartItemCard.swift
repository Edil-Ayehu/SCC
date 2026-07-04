//
//  CartItemCard.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct CartItemCard: View {

    let item: CartItem
    
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {

        HStack(spacing: 16) {

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.08))
                .frame(width: 80, height: 80)
                .overlay {
                    Image(systemName: "photo")
                        .font(.title2)
                        .foregroundColor(.gray)
                }

            Text(item.product.name)
                .font(.custom("Outfit-Regular", size: 16))

            Spacer()

            QuantityStepper(
                quantity: item.quantity,
                onIncrease: {
                    cartVM.increase(item)
                },
                onDecrease: {
                    cartVM.decrease(item)
                }
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.04), radius: 8, y: 3)
    }
}
