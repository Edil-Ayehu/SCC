//
//  EmptyStateView.swift
//  SCC
//
//  Created by Edil on 11/07/2026.
//


import SwiftUI

struct EmptyStateView: View {

    let image: String
    let title: String
    let message: String

    var body: some View {

        VStack(spacing: 16) {

            Image(systemName: image)
                .font(.system(size: 50))
                .foregroundColor(.gray.opacity(0.6))

            Text(title)
                .font(.custom("Outfit-Medium", size: 18))
                .foregroundColor(.black)

            Text(message)
                .font(.custom("Outfit-Regular", size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
