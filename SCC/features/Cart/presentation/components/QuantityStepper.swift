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
                    .frame(width: 24, height: 24)
                    .overlay {
                        Image(systemName: "minus")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
            }

            Text("\(quantity)")
                .font(.custom("Outfit-Medium", size: 16))
                .frame(minWidth: 16)

            Button (action: onIncrease) {

                Circle()
                    .fill(Color.indigo)
                    .frame(width: 24, height: 24)
                    .overlay {
                        Image(systemName: "plus")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }
            }
        }
    }
}
