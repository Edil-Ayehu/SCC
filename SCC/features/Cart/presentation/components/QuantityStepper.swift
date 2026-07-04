//
//  QuantityStepper.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct QuantityStepper: View {

    @Binding var quantity: Int

    var body: some View {

        HStack(spacing: 14) {

            Button {
                if quantity > 1 {
                    quantity -= 1
                }
            } label: {

                Circle()
                    .fill(Color.gray.opacity(0.12))
                    .frame(width: 34, height: 34)
                    .overlay {
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                    }
            }

            Text("\(quantity)")
                .font(.custom("Outfit-SemiBold", size: 20))
                .frame(minWidth: 24)

            Button {
                quantity += 1
            } label: {

                Circle()
                    .fill(Color.indigo)
                    .frame(width: 34, height: 34)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
            }
        }
    }
}
