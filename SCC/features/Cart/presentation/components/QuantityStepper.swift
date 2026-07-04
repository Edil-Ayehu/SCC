//
//  QuantityStepper.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct QuantityStepper: View {

    let quantity: Int
    let onIncrease: () -> Void
    let onDecrease: () -> Void

    var body: some View {

        HStack(spacing: 14) {

            Button (action: onDecrease) {

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

            Button (action: onIncrease) {

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
