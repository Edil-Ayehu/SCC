//
//  EmptyCartView.swift
//  SCC
//
//  Created by Edil on 04/07/2026.
//

import SwiftUI

struct EmptyCartView: View {

    var body: some View {

        VStack(spacing: 24) {

            Spacer()

            Image(systemName: "cart")
                .font(.system(size: 80))
                .foregroundColor(.gray.opacity(0.5))

            VStack(spacing: 8) {

                Text("Your cart is empty")
                    .font(.custom("Outfit-SemiBold", size: 22))

                Text("Looks like you haven't added any products yet.")
                    .font(.custom("Outfit-Regular", size: 15))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }


            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
